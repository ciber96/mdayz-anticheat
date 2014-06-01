function checkStats()
    for k, player in ipairs(getElementType("player")) do
        checkHealth(player)
        verifyFood(player)
        verifyThirst(player)
    end
end
setTimer(verifyStat, 5000, 0)

function checkHealth(player)
    local vHealth = getElementData(player, "blood") or 0
    if vHealth >= 12001 then
        setElementData(player, "blood", 12000)
        kickPlayer(player, "You use cheat")
    end
end

function checkFood(player)
    local vFood = getElementData(player, "food") or 0
    if vFood >= 101 then
        setElementData(player, "food", 30)
        kickPlayer(player, "You use cheat")
    end
end

function checkThirst(player)
    local vFood = getElementData(player, "thirst") or 0
    if vFood >= 101 then
        setElementData(player, "thirst", 30)
        kickPlayer(player, "You use cheat")
    end
end
