print("Layering is about to get worse?")

local clearCounter = 0
local playerset = {}
playerset[0] = UnitName("player") .. "-Faerlina"
print(playerset[0])

function load()
    JoinChannelByName("betalayer")
end

load()

local button = CreateFrame("Button", "LayerFool", UIParent, "UIPanelButtonTemplate")
button:SetSize(80, 25)
button:SetText("I <3 retail")
button:SetPoint("CENTER", 0,400)
button:SetMovable(true)

button:RegisterEvent("CHAT_MSG_CHANNEL")

local function chatFilter(self, event, msg, author, language, channel, ...)
    if msg:find("layerme") then
        clearCounter = clearCounter + 1
        
        print("inviting player " .. author)
        
        isSelf = false
        
        for i= -1, getn{playerset} do
            if author == playerset[i] then
                print("found self in database")
                isSelf = true
            end           
        end
        
        if not isSelf then
            print(playerset[0])
            table.insert(playerset, author)
            InviteUnit(author)
            C_Timer.After(5, function()
                print("kicking player")
                UninviteUnit(author)
            end)    
        end
        
        if clearCounter == 10 then 
            playerset = {}
            playerset[0] = UnitName("player") .. "-Faerlina"
        end
        
    end
end

button:SetScript("OnEvent", chatFilter)

button:SetScript("OnClick", function()
    print("looking for new layer...")
    SendChatMessage("layerme", "CHANNEL", nil, (GetChannelName("layerme")))
end)
