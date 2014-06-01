function checkHealth()
    local vHealth = getElementData(source, "blood") or 0
    local admingodmod = getElementData(source, "onAdminInGod")
    if ( admingodmod == false ) then
        if vHealth >= 12001 then
            setElementData(source, "blood", 12000)
            kickPlayer(source, "You use cheat")
            --banPlayer(source, getRootElement(), "You are banned")
        end
    end
end
addEvent("goCheckHealth", true)
addEventHandler("goCheckHealth", getRootElement(), checkHealth)

function checkFood()
    local vFood = getElementData(source, "food") or 0
    local admingodmod = getElementData(source, "onAdminInGod")
    if ( admingodmod == false ) then
        if vFood >= 101 then
            setElementData(source, "food", 30)
            kickPlayer(source, "You use cheat")
            --banPlayer(source, getRootElement(), "You are banned")
        end
    end
end
addEvent("goCheckFood", true)
addEventHandler("goCheckFood", getRootElement(), checkFood)

function checkThirst()
    local vFood = getElementData(source, "thirst") or 0
    local admingodmod = getElementData(source, "onAdminInGod")
    if ( admingodmod == false ) then
        if vFood >= 101 then
            setElementData(source, "thirst", 30)
            kickPlayer(source, "You use cheat")
            --banPlayer(source, getRootElement(), "You are banned")
        end
    end
end
addEvent("goCheckThirst", true)
addEventHandler("goCheckThirst", getRootElement(), checkThirst)

-- GOD MOD (Not detected by the anti-cheat)
function adminGod(source)
    local accName = getAccountName(getPlayerAccount(source))
    if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then
        local pf = getElementData(source, "cmd.start")
        if ( pf == false ) then
            setElementData(source, "cmd.start", true)
            setElementData(source, "onAdminInGod", true)
            setElementData(source, "blood", 9999999999999999)
        elseif ( pf == true ) then
            setElementData(source, "cmd.start", false)
            setElementData(source, "onAdminInGod", false)
            setElementData(source, "blood", 12000)
        end
    else
        outputChatBox ("You are not admin !", getRootElement(), 255, 0, 0, true )
    end
end
addCommandHandler("admingod", adminGod)