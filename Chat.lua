--------------------------------------------
-- Reported v2.0 by Goon Squad
-- @project-name@ @project-revision@ @project-hash@
-- @file-name@ @file-revision@ @file-hash@
--------------------------------------------
-- Herein lie the detection and reponse algorithms

local addon = select(2, ...)
local  _G = _G
local Reported = _G.Reported

local rand, ipairs, tostring, strlower = math.random, ipairs, tostring, strlower
local GetTime, PlaySoundFile, SendChatMessage = GetTime, PlaySoundFile, SendChatMessage
local moduleText = addon.moduleText

local db, channelToggleButton, playerName, myGUID

local events = addon.chatEvents
local nextCheckTime = 0

-- debug messages; does nothing when the toolkit isn't present and active
local print = function(...) if _G.Devian and _G.Devian.InWorkspace() then print('Reported', ...) end end

addon.Parse = function(self, event, message, sender, channelName, _, target, _, _, channelNumber)

  print(self, event, message, sender, channelName, _, target, _, _, channelNumber)
  if GetTime() <= nextCheckTime then
    return
  end

  local filteredname = sender:gsub("%-.+", "")
  local chatType = events[event]
  local chatID = chatType

  if chatType == 'CHANNEL' then
    if not addon.vars.channels[chatType .. channelNumber] then
      return
    end
    chatID = chatID .. channelNumber
  end
  print(chatType, chatID, sender)

  message = ' ' .. strlower(message) .. ' ' -- pad with spaces for matching full words
  local hasSwear = false
  local detectedWord
  local lastWord
  for i, cussString in ipairs(addon.vars.Dictionary) do

    detectedWord = message:match(cussString)
    lastWord = cussString
    if detectedWord then
      detectedWord = detectedWord:gsub("^%s+", ""):gsub("%s+$", "")
      PlaySoundFile([[Interface\Addons\SharedMedia_MyMedia\sound\Quack.ogg]])
      hasSwear = true
      break
    end
  end
  print('pattern check ended at "'..tostring(lastWord)..'"')

  if hasSwear then
    sender=  sender:gsub("%-.+$", "")
    nextCheckTime = GetTime() +  addon.vars.Throttle
    local delay = rand(addon.vars.DelayMin, addon.vars.DelayMax)
    local message, module, line, total, session = addon.GetLine(filteredname)
    addon.SetTimer(self, delay, 1, function()
      PlaySoundFile([[Interface\Addons\SharedMedia_MyMedia\sound\IM.ogg]])
      SendChatMessage(message, chatType, nil, channelNumber)
      addon.SetTimer(self, addon.vars.Throttle, 2)
    end)
    local numReports = 1

    addon.vars.modules[module] = addon.vars.modules[module] or {true, 0, 0 }
    addon.vars.modules[module][2] = addon.vars.modules[module][2] + 1

    addon.print('Reporting |cFFFFFF88'.. filteredname .. '|r for "|cFFFF0000'..detectedWord..'|r" (#'..(addon.vars.modules[module][2])..') in |cFF00FFFF' .. chatID .. '|r (|cFF00FF00'..module..'|r, |cFFFFFF00'..line..'|r).')
  end
end




addon.GetLine = function(filteredname)
  local module = addon.enabledModules[rand(1,#addon.enabledModules)]
  local line = rand(1, #moduleText[module])
  local text = moduleText[module][line]
  text = text:gsub("%%Pl", filteredname);
  text = text:gsub("%%PL", strupper(filteredname));
  text = text:gsub("%%pl", strlower(filteredname));
  addon.vars.modules[module] = addon.vars.modules[module] or {true, 0, 0 }

  if #addon.vars.LineSuffix >= 1 then
    text = text .. ' ' .. addon.vars.LineSuffix
  end

  return text, module, line, unpack(addon.vars.modules[module])
end



-- deals with timing delayed reponses and output throttle
-- priority value is used to safeguard against timer spam
addon.SetTimer = function(self, duration, priority, payload)
  if self.duration == 0 or priority > self.priority then
    C_Timer.After(duration, function()
      self.duration = 0
      self.expire = 0
      self.priority = 0
      if payload then
        payload()
      end
    end)
    self.current = GetTime()
    self.duration = duration
    self.expire = self.current+ self.duration
    self.priority = priority

    self:SetScript('OnUpdate', Reported_OnUpdate)
    self.progress:SetTexture(priority-1, 2-priority, 0, 1)
    self.payload = payload
    self.progress:Show()
    self.time:Show()
    return true
  end
  return false
end