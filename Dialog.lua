--------------------------------------------
-- Reported v2.0 by Goon Squad
-- @project-name@ @project-revision@ @project-hash@
-- @file-name@ @file-revision@ @file-hash@
--------------------------------------------

local addon = select(2, ...)
local  _G = _G
local Reported = _G.Reported
local print = function(...) if _G.Devian and _G.Devian.InWorkspace() then print('Reported', ...) end end

local pairs, ipairs, unpack, floor, sort, wipe = pairs, ipairs, unpack, floor, table.sort, table.wipe
local CreateFrame, UnitName = CreateFrame, UnitName
local fauxScrollEntries, fauxScrollOffset = 0, 0



--- Herein lie frame handlers
local JournalButton_OnClick = function(self)
  if addon.vars.modules[self.moduleName] then
    if addon.vars.modules[self.moduleName][1] == true then
      addon.vars.modules[self.moduleName][1] = false
    else
      addon.vars.modules[self.moduleName][1] = true
    end
  else
    addon.vars.modules[self.moduleName] = { true, 0, 0 }
  end
  addon.UpdateEntries()
  addon.UpdateModules()
end


local ChatChannelButton_OnShow = function(self)

  if addon.vars.channels.CHANNEL then
    self:Enable()
  else
    self:Disable()
  end
end
local ChatChannelButton_OnClick = function(self)
  addon.vars.channels[self.chatID] = self:GetChecked()
  ChatChannelButton_OnShow(self)
end

local ChatButton_OnClick = function(self, value)
  local value = self:GetChecked()
  if self.chatType == 'CHANNEL' then
    -- chat channel buttons
    for i = 1, 10 do
      if value == true then
        self.numbers[i]:Enable()
      else
        self.numbers[i]:Disable()
      end
    end
  end
  addon.vars.channels[self.chatType] = value

end

--- Herein lie widget handlers
local OnClick = {}
local OnValueChanged = {}
local OnEnterPressed = {}
local OnEscapePressed = {}
OnEnterPressed.Dictionary = function(self)
  local wordlist = {}
  local words = self:GetText()
  local position = 0
  local n = 1
  local offset = word:find('\n')
  repeat
    local cussword = words:sub(position, offset)
    cussword = cussword:gsub('*', '[%s*]'):gsub('|end', '%A'):gsub('start|', '%A')
    cussword = cussword:gsub('^%s+', ''):gsub('%s+$', '')
    print('  saving cussword pattern:', cussword)
    tinsert(wordlist, cusswords)

    position = offset+1
    offset = word:find('\n', position)
  until offset >= #words


end
OnEscapePressed.LineSuffix = function(self)

end

OnValueChanged.DelayMin = function(self)
  if self:GetValue() > Reported.DelayMax:GetValue() then
    Reported.DelayMax:SetValue(self:GetValue())
  end
  addon.vars.DelayMin = self:GetValue()
  self.label:SetFormattedText("%0.1f", self:GetValue())
end
OnValueChanged.DelayMax = function(self)
  if self:GetValue() < Reported.DelayMin:GetValue() then
    Reported.DelayMin:SetValue(self:GetValue())
  end
  addon.vars.DelayMax = self:GetValue()
  print('DelayMax', addon.vars.DelayMax)
  self.label:SetFormattedText("%0.1f", self:GetValue())
end
OnValueChanged.Throttle = function(self)
  addon.vars.Throttle = floor(self:GetValue()+.5)
  self.label:SetFormattedText("%d", addon.vars.Throttle)
end

OnClick.EnableState = function(self)
  addon.vars.EnableState = self:GetChecked()
  Reported.enabled = addon.vars.EnableState
  addon.UpdateEnableState()
end
OnClick.NoAFK = function(self)
  addon.vars.NoAFK = self:GetChecked()
  addon:PlayerFlagsChanged()
end
OnClick.TestButton = function(self)
  local text, module, line,  enabled, total, session = addon.GetLine(UnitName('player'))
  addon.print('Test:\n'.. text .. '\n(|cFF00FF00'.. module..'|r. |cFFFFFF00' .. line .. '|r).')
end
OnClick.CloseButton = function()
  Reported.fadeOut:Play()
end

---- Defined in global space for simplicity; they are only looked up once so it's probably okay

-- journal scrollwheel activity
addon.OnScroll = function(self, delta)
  if delta < 0 then
    fauxScrollOffset = fauxScrollOffset + 5
    if (fauxScrollOffset + fauxScrollEntries) >= #addon.orderedModules then
      fauxScrollOffset = #addon.orderedModules - fauxScrollEntries
    end
  else
    fauxScrollOffset = fauxScrollOffset - 5
    if fauxScrollOffset <= 0 then
      fauxScrollOffset = 0
    end
  end
  addon.UpdateEntries(self)
end

-- any time the /reported UI is opened
addon.OnShow = function(self)
  local db = addon.vars
  local last, up = self.channelsHeader, self.channelsHeader
  local anchor, point, x, y = 'TOPLEFT', 'BOTTOMLEFT', 0, -2
  self:EnableMouse(true)
  self:EnableMouseWheel(true)
  self.channels = self.channels or {}

  local buttonSize

  for index, chatType in ipairs(addon.chatOrder) do
    local monitor = addon.monitors[chatType]
    self.channels[index] = self.channels[index] or CreateFrame('CheckButton', 'Reported'.. chatType..'Button', self, 'ReportedCheckButton')
    local button = self.channels[index]

    button.label:SetText(monitor.label)
    button:SetPoint(anchor, last, point, x, y)
    button:SetChecked(addon.vars.channels[chatType])
    button:SetID(index)
    button.chatType = chatType
    if mod(index,2) == 1 then
      up = button

    end

    if mod(index,2) == 0 then
      last, anchor, point, x, y = up, 'TOPLEFT', 'BOTTOMLEFT', 0, -4
    else
      last, anchor, point, x, y = button, 'TOPLEFT', 'TOPRIGHT', 1, 0
    end


    if chatType == 'CHANNEL' then
      buttonSize = button:GetHeight() + 4

      button.numbers = button.numbers or {}
      local lastChannel = last
      for channel = 1, 10 do
        local from, target, to, x, y
        if channel == 1 then
          from, target, to, x, y= 'TOPLEFT', lastChannel, 'TOPRIGHT', 0 , -4

        else
          from, target, to, x, y= 'TOPLEFT', lastChannel, 'TOPRIGHT', 1, 0
        end

        local chatID = 'CHANNEL' .. channel
        button.numbers[channel] = button.numbers[channel] or CreateFrame('CheckButton', 'Reported'.. chatID..'Button', self, 'ReportedChannelCheckButton')
        local channelButton = button.numbers[channel]

        channelButton:SetID(channel)
        channelButton.chatType = chatType
        channelButton.chatID = chatID
        channelButton:SetChecked(addon.vars.channels[chatID])
        channelButton.label:SetText(channel)
        channelButton.label:ClearAllPoints()
        channelButton.label:SetPoint('CENTER')
        channelButton:SetPoint(from, target, to, x, y)
        channelButton:SetChecked(addon.vars.channels[chatID])
        lastChannel = channelButton
        channelButton:SetScript('OnClick', ChatChannelButton_OnClick)
        ChatChannelButton_OnShow(channelButton)
      end
    end
    button:SetScript('OnClick', ChatButton_OnClick)
  end

  -- sum of header, button+padding, padding
  local buttonsHeight = ceil(#addon.chatOrder/2) * buttonSize + self.channelsHeader:GetHeight() + 4
  Reported.entryList:SetPoint('BOTTOMRIGHT', Reported, 'BOTTOMRIGHT', 0, buttonsHeight)

  addon.UpdateEntries(self)

  for name, func in pairs(OnClick) do
    if self[name] then
      print('identified region |cFFFF0088', name)
      local region = self[name]
      if region.SetChecked and db[name] then
        region:SetChecked(db[name])
      end
      --func(region)
      region:SetScript('OnClick', func)
    end
  end
  for name, func in pairs(OnValueChanged) do
    if self[name] then
      local region = self[name]
      if region.SetValue and db[name] then
        region:SetValue(db[name])
      end

      func(region)
      region:SetScript('OnValueChanged', func)
    end
  end

  for name, func in pairs(OnEnterPressed) do
    if self[name] and self[name].SetText then
      local text = table.concat(db[name] or {},'\n') or ""
      text = text:gsub('%%s%*', '%*')
      text = text:gsub('%%A', '%"')
      self[name]:SetText(text)
    end
    self[name]:SetScript('OnEnterPressed', func)
  end

  addon.vars.dialog = true
end

-- any time the /reported UI is closed
addon.OnHide = function(self)
  self:EnableMouse(false)
  self:EnableMouseWheel(false)
  addon.vars.dialog = false
end



addon.OnUpdate = function(self, elapsed)
  self.current = self.current + elapsed
  if self.duration > 0 then
    local remaining = self.expire - self.current
    if remaining <= 0 then
      self:SetScript('OnUpdate', nil)
      self.time:Hide()
      self.progress:Hide()
    else
      self.time:SetFormattedText('%0.2f / %d', remaining, self.duration)
      self.progress:SetWidth(ChatFrame1:GetWidth() * max(0,(remaining/self.duration)))
    end
  end
end


-- module selection
local entryHeight, entryWidth
local orderedNames, orderedModules, moduleText = addon.orderedNames, addon.orderedModules, addon.moduleText
addon.UpdateEntries = function()
  local db = addon.vars

  -- reset the module journal
  wipe(addon.orderedModules)
  sort(addon.orderedNames, addon.ModuleSort)
  for i, v in ipairs(addon.orderedNames) do
    addon.orderedModules[i] = addon.moduleText[v]
  end

  Reported.entries = Reported.entries or {}
  local last= Reported.entryListHeader

  if not Reported.entries[1] then
    -- create a dummy entry so we can get measurements
    Reported.entries[1] = CreateFrame('Button', 'ReportedModuleEntry1', Reported, 'ReportedModuleentry')
    Reported.entries[1].text:SetText('bar')
    entryHeight = Reported.entries[1].text:GetStringHeight() + 10
    entryWidth = Reported.entryList:GetWidth()
    fauxScrollEntries = floor(Reported.entryList:GetHeight() / entryHeight)
  end

  for i = 1, fauxScrollEntries do
    Reported.entries[i] = Reported.entries[i] or CreateFrame('Button', 'ReportedModuleEntry'..i, Reported, 'ReportedModuleentry')
    local entry = Reported.entries[i]
    local index = i + fauxScrollOffset

    entry.moduleName = orderedNames[index]
    entry.text:SetText('|cFF66DDFF' .. orderedNames[index].. '|r - ' .. (orderedModules[index].Description or "") .. (orderedModules[index].Credit and (' |cFFFFFF00by '.. orderedModules[index].Credit) or ""))
    entry:SetSize(entryWidth, entryHeight)
    entry:SetPoint('TOPLEFT', last, 'BOTTOMLEFT', 0, 0)
    entry:SetScript('OnClick', JournalButton_OnClick)

    local numModules, numLines = 0, 0
    if addon.vars.modules[orderedNames[index]] and addon.vars.modules[orderedNames[index]][1] then
      entry.bg:SetColorTexture(.2,0.4,.2, 1)
      numModules= numModules + 1
      numLines = numLines + #moduleText[orderedNames[index]]
    else
      entry.bg:SetColorTexture(.2, .2, .2, 1)
    end
    last = entry
  end

  Reported.JournalThumb:SetPoint('TOP', Reported.entryList, 'TOP', 0, -fauxScrollOffset * Reported.entryList:GetHeight()/#orderedNames)
  Reported.JournalThumb:SetHeight((fauxScrollEntries/#orderedNames) * Reported.entryList:GetHeight())
end

Reported:SetScript('OnEvent', addon.OnEvent)
Reported:SetScript('OnShow', addon.OnShow)
Reported:SetScript('OnHide', addon.OnHide)
Reported:SetScript('OnMouseWheel', addon.OnScroll)