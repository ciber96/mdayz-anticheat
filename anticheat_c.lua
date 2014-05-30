function verifyHealth()
    triggerServerEvent("goCheckHealth", getLocalPlayer())
end
setTimer(verifyHealth, 1000, 0)

function verifyFood()
    triggerServerEvent("goCheckFood", getLocalPlayer())
end
setTimer(verifyFood, 1000, 0)

function verifyThirst()
    triggerServerEvent("goCheckThirst", getLocalPlayer())
end
setTimer(verifyThirst, 1000, 0)