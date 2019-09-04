--------------------------------------------
-- Reported v2.0 by Goon Squad
-- @project-name@ @project-revision@ @project-hash@
-- @file-name@ @file-revision@ @file-hash@
--------------------------------------------

BINDING_HEADER_REPORTED = "Reported!";
BINDING_NAME_REPORTEDTOGGLEFILTER = "Toggle Chat Triggers";
BINDING_NAME_REPORTEDTOGGLEUI = "Toggle Options Panel"

local addon = select(2, ...)
local  _G = _G

local Reported = Reported
local rand, pairs, ipairs, type, unpack, floor, max, select, sort, wipe = math.random, pairs, ipairs, type, unpack, floor, max, select, sort, table.wipe
local GetTime, PlaySoundFile, tostring, strupper, strlower, rep = GetTime, PlaySoundFile, tostring, strupper, strlower, string.rep
local CreateFrame, SendChatMessage, UnitIsAFK, UnitName, UnitGUID = CreateFrame, SendChatMessage, UnitIsAFK, UnitName, UnitGUID
local nextCheckTime, modulesAvailable, fauxScrollEntries, fauxScrollOffset = 0, 0, 0, 0
local db, channelToggleButton, playerName, myGUID

-- debug messages; does nothing when the toolkit isn't present and active
local print = function(...) if _G.Devian and _G.Devian.InWorkspace() then print('Reported', ...) end end

-- chat window output
local Msg = function(text)
  if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage('|cFFFFFF00Reported|r: ' ..text) end
end
addon.print = Msg
local versionString = 7030001
local dictionaryVersion = 73

-- default config values
local defaults = {
  channels = {
    SAY = false,
    YELL = true,
    INSTANCE = true,
    BATTLEGROUND = true,
    CHANNEL1 = true,
    CHANNEL2 = true
  },
  modules = {
    ['Default'] = {false, 0, 0},
    ['Riko'] = {true, 0, 0},
  },
  EnableState = true,
  DialogState = true,
  FilterRealmNames = true,
  DelayMin = 2,
  DelayMax = 6,
  Throttle = 24,
  NoAFK = true,
  LineSuffix = '',
  Dictionary =  {
    "%Af+%s*a+%s*g+%A", -- [1]
    "d+%s*a+%s*m+%s*n+", -- [2]
    "%Af+%s*u+[qck%s]+%A", -- [3]
    "%As+%s*h+%s*i+%s*t+%A", -- [4]
    "[%Ar]f+%s*u+[qck%s]+e+%s*r+", -- [5]
    "%Af+%s*a+%s*g+%s*[oi]+%s*t+", -- [6]
    "%Ad+%s*a+%s*f+%s*u+[qck%s]+", -- [7]
    "%An+%s*i+%s*gg+%s*e+%s*[ra]+", -- [8]
    "%Ac+%s*u+%s*n+%s*t+", -- [9]
    "%Ab+%s*i+%s*t*%s*c+%s*h+", -- [10]
	"%Af+%s*u+%s*c+%s*k+%s*i+%s*n+%s*g+", -- [11]
    "%Ad+%s*o+%s*u+%s*c+%s*h+%s*e+", -- [12]
    "%Aa+%s*s+%s*h+%s*o+%s*l+%s*e+", -- [13]
    "%Aa%s*s%s*s+%A", -- [14]
    "%Ac+%s*h+%s*i+%s*n+%s*[kqc]+%A", -- [15]
    "%Aa+%s*s+%s*e+%s*s+%A", -- [16]
    "%As+%s*p+%s*i+%s*c%s*%A+", -- [17]
    "%Ac+%s*o%s*c+%s*[k%s]+%A", -- [18]
    "%Ad+%s*i+%s*[qck%s]+%A", -- [19]
    "%Ad+%s*a+%s*n+%s*g+%A", -- [20]
    "d+%s*a+%s*mm*%s*i+%s*t+", -- [21]
    "%Ad+%s*a+%s*r+%s*n+%A", -- [22]
    "%Aranga%A", -- [23]
  }
}
local events = {
  ["CHAT_MSG_SAY"] = 'SAY',
  ["CHAT_MSG_YELL"] = 'YELL',
  ['CHAT_MSG_GUILD'] = 'GUILD',
  ['CHAT_MSG_OFFICER'] = 'OFFICER',
  ['CHAT_MSG_PARTY'] = 'PARTY',
  ['CHAT_MSG_RAID'] = 'RAID',
  ['CHAT_MSG_CHANNEL'] = 'CHANNEL',
  ['CHAT_MSG_WHISPER'] = 'WHISPER',
  ['CHAT_MSG_RAID_LEADER'] = 'RAID',
  ['CHAT_MSG_PARTY_LEADER'] = 'PARTY',
}

addon.chatEvents = events
addon.orderedNames = {}
addon.orderedModules = {}
addon.dictionary = {}
addon.enabledModules = {}
local swears = addon.dictionary
local orderedNames = addon.orderedNames
local orderedModules = addon.orderedModules
local enabledModules = addon.enabledModules
local moduleText = addon.moduleText

local monitors_order = {
  'SAY', 'YELL', 'PARTY', 'RAID', 'INSTANCE_CHAT', 'BATTLEGROUND', 'GUILD', 'OFFICER', 'CHANNEL'
}

addon.chatOrder = monitors_order
local monitors = {
  SAY = {
    enable = true,
    label = _G.SAY
  },
  YELL = {
    enable = true,
    label = _G.YELL
  },
  INSTANCE_CHAT = {
    enable = true,
    label = _G.INSTANCE
  },
  CHANNEL = {
    enable = true,
    label = _G.CHAT,
  },
  RAID = {
    enable = false,
    label = _G.RAID
  },
  PARTY = {
    enable = false,
    label = _G.PARTY
  },
  BATTLEGROUND = {
    enable = true,
    label = _G.BATTLEGROUND
  },
  GUILD = {
    enable = false,
    label = _G.GUILD,
  },
  OFFICER = {
    enable = false,
    label = _G.OFFICER
  },
}
addon.monitors = monitors



Reported.ToggleFilters = function()
  addon.vars.EnableState = (addon.vars.EnableState ~= true) and true or false
  Reported.enabled = addon.vars.EnableState
  addon.UpdateEnableState()
end

Reported.ToggleUI = function()
  if Reported:IsVisible() then
    Reported.fadeOut:Play()
    db.DialogState = false
  else
    Reported.fadeIn:Play()
    db.DialogState = true
  end
end


---- These are all prompted by user action and therefore have to be accessible to one another
-- chat command
addon.Command = function(input)
  local keyword = input:match("%a+")
  if keyword == 'toggle' then
    Reported.ToggleFilters()
    return
  end
  Reported.ToggleUI()
end


-- used to sort module list with selected modules placed at the top
addon.ModuleSort = function(a,b)
  if db.modules[a] and (db.modules[a][1] == true) then
    if db.modules[b] and (db.modules[b][1] == true) then
      --print('and(', a, ',', b') = true, but a < b =', (a < b))
      return a < b
    else
      --print('and(', a, ' true,', b,' false) = true')
      return true
    end
  elseif db.modules[b] and (db.modules[b][1] == true) then
    --print(a, 'false', b, 'true, so false')
    return false
  else
    return a < b
  end
end

-- player login/zoning
addon.Initialize = function()
  -- shortcuts
  -- player info
  myGUID = UnitGUID('player')

  -- fetch savedvars
  _G.ReportedDB = _G.ReportedDB or {}
  db = _G.ReportedDB
  for k,v in pairs(defaults) do
    if db[k] == nil then
      db[k] = v
    end

    if type(v) == 'table' then
      for kk, vv in pairs(defaults[k]) do
        if db[k][kk] == nil then
          db[k][kk] = vv
        end
      end
    end
  end

  if versionString > (db.versionString or 0) then
    db.versionString = versionString
    db = defaults
    Msg('Saved options were reset for a recent update. This message will self-destruct.')
  elseif dictionaryVersion > (db.dictionaryVersion or 0) then
    _G.ReportedDB.Dictionary = defaults.Dictionary
    db.dictionaryVersion = dictionaryVersion
    Msg('Dictionary was reset for a recent update. This message will self-destruct.')
  end

  addon.vars = db

  -- resolve watched channels
  for chatID, monitor in pairs(monitors) do
    print('watching', monitor.label)
    monitor.enable = db.channels[chatID] and db.channels[chatID] or false
  end

  addon.UpdateModules()
  Reported:UnregisterEvent('ADDON_LOADED')
  Reported:RegisterUnitEvent('PLAYER_FLAGS_CHANGED', 'player')
  addon.UpdateEnableState(true)

  if db.dialog == true and not Reported:IsVisible() then
    Reported.fadeIn:Play()
  end
end

addon.UpdateModules = function()
  -- compile stats
  local moduleLines = 0
  wipe(addon.orderedNames)
  wipe(addon.enabledModules)
  for name, module in pairs(addon.moduleText) do
    local i = #addon.orderedNames+1
    addon.orderedNames[i] = name

    if db.modules[name] then
      local enabled, totalReports = unpack(db.modules[name])
      db.modules[name][3] = 0
      if enabled then
        local newindex = #addon.enabledModules + 1
        --print('|cFFFF0088'..newindex..'|r', name)
        addon.enabledModules[newindex] = name
        moduleText[name].index = newindex
        moduleLines = moduleLines + #moduleText[name]
      end
    end
  end
  local numModules = #addon.enabledModules
  local modulesString = tostring(numModules) .. ' module'..((numModules ~= 1) and 's' or '')..', '.. tostring(moduleLines).. ' lines'
  Reported.stats:SetText(modulesString)
end

-- addon function is toggled
addon.UpdateEnableState = function(quiet)
  if Reported.enabled == false then
    Reported:UnregisterAllEvents()
    if not quiet then
      if db.EnableState == false then
        Msg("|cFFFFFF00Reported|r toggled |cFFFF0000Off|r.")
      else
        Msg("|cFFFFFF00Reported|r standing by.")
      end
    end
  else
    for event, chatID in pairs(events) do
      Reported:RegisterEvent(event)
    end
    if not quiet then Msg("|cFFFFFF00Reported|r toggled |cFF00FF00On|r.") end
  end


  if Reported:IsVisible() then
    Reported.EnableState:SetChecked(addon.vars.EnableState)
  end
end

-- player's AFK state changed
addon.PlayerFlagsChanged = function()
  local enabled = Reported.enabled
  if UnitIsAFK('player') and db.NoAFK then
    if Reported:IsVisible() then
      Reported.playerFlag:Show()
      Reported.playerFlag:SetText('AFK')
    end
    Reported.enabled = false
  else
    if Reported:IsVisible() then
      Reported.playerFlag:Hide()
    end
    Reported.enabled = db.EnableState
  end
  if enabled ~= Reported.enabled then
    addon.UpdateEnableState()
  end
end



addon.OnEvent = function(self, event, ...)
  if event == 'ADDON_LOADED' then
    if select(1,...)  == 'Reported' then
      addon.Initialize()
      addon.PlayerFlagsChanged()
    end
  elseif event == 'PLAYER_FLAGS_CHANGED'  then
    addon.PlayerFlagsChanged()
  elseif events[event] then
    local guid = select(12,...)
    print('|cFF00FF00', event, guid)
    if guid and guid ~= myGUID then
      if events[event] and db.channels[events[event]] then
        addon.Parse(self, event, ...)
      end
    end
  end
end

Reported.duration, Reported.expire, Reported.priority = 0, 0, 0 -- prime the throttle timer
Reported:RegisterEvent('ADDON_LOADED')
Reported:RegisterForDrag('LeftButton')
Reported.Dictionary = Reported.DictionaryScroll.Dictionary
_G.SLASH_REPORTED1 = "/reported"
_G.SlashCmdList['REPORTED'] = addon.Command