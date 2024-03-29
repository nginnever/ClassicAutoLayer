print("Auto Layering Initialized")

local clearCounter = 0
local playerset = {}
playerset[0] = UnitName("player") .. "-Faerlina"

function load()
    JoinChannelByName("layerme")
end

load()

local button = CreateFrame("Button", "LayerFool", UIParent, "UIPanelButtonTemplate")
button:SetSize(80, 25)
button:SetText("I <3 retail")
button:SetPoint("CENTER", 0,400)
button:SetMovable(true)
button:SetMovable(true)
button:EnableMouse(true)
button:RegisterForDrag("LeftButton")

button:SetScript("OnDragStart", button.StartMoving)
button:SetScript("OnDragStop", button.StopMovingOrSizing)

button:RegisterEvent("CHAT_MSG_CHANNEL")

local function chatFilter(self, event, msg, author, language, channel, ...)
    if msg:find("layerme") then
        clearCounter = clearCounter + 1
        
        isSelf = false
        
        if author == playerset[0] then
            isSelf = true
        end
        
        if not isSelf then
            -- table.insert(playerset, author)
            InviteUnit(author)
            -- C_Timer.After(5, function()
            --    UninviteUnit(author)
            -- end)
        end
        
        -- if clearCounter == 10 then 
        --    playerset = {}
        --    playerset[0] = UnitName("player") .. "-Faerlina"
        -- end
        
    end
end

button:SetScript("OnEvent", chatFilter)

button:SetScript("OnClick", function()
    print("looking for new layer...")
    SendChatMessage("layerme", "CHANNEL", nil, (GetChannelName("autolayer")))
end)
