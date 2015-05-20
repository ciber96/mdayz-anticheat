-- Settings
 maxHealth = 12000
 maxFood = 100
 maxThirst = 100
 maxSlots = 80 -- You must put the number of slots of the best backpack of your server

setTimer(function()
    for k, player in ipairs(getElementsByType("player")) do
        checkHealth(player)
        checkFood(player)
        checkThirst(player)
        checkSlots(player)
    end
end, 1000, 0)

function checkHealth(thePlayer)
    local vHealth = getElementData(thePlayer, "blood") or 0
    if vHealth > maxHealth then
        setElementData(thePlayer, "blood", 12000)
        triggerEvent("onPlayerDetected", thePlayer, "Health")
    end
end

function checkFood(thePlayer)
    local vFood = getElementData(thePlayer, "food") or 0
    if vFood > maxFood then
        setElementData(thePlayer, "food", 30)
        triggerEvent("onPlayerDetected", thePlayer, "Food")
    end
end

function checkThirst(thePlayer)
    local vThirst = getElementData(thePlayer, "thirst") or 0
    if vThirst > maxThirst then
        setElementData(thePlayer, "thirst", 30)
        triggerEvent("onPlayerDetected", thePlayer, "Thirst")
    end
end

function checkSlots(thePlayer)
    local vSlots = getElementData(thePlayer, "MAX_Slots") or 0
    if vSlots > maxSlots then
        setElementData(thePlayer, "MAX_Slots", 0)
        triggerEvent("onPlayerDetected", thePlayer, "Slots")
    end
end

function onPlayerDetected(source, name)
    kickPlayer(source, "[AC] : "..name.." Hack")
end
addEvent("onPlayerDetected", true)
addEventHandler("onPlayerDetected", root, onPlayerDetected)

function detectVehicleCheat(vehicle, seat, jacked)
  if ( getElementModel(vehicle) == 432 or getElementModel(vehicle) == 425 or getElementModel(vehicle) == 501 or getElementModel(vehicle) == 564 or getElementModel(Vehicle) == 594 or getElementModel(vehicle) == 601 or getElementModel(vehicle) == 447 or getElementModel(vehicle) == 520 ) then
    if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(source)), aclGetGroup ( "Everyone" ) ) then
       kickPlayer(source, "[AC] : Vehicle Hack")
    end
  end
end
addEventHandler("onPlayerVehicleEnter", getRootElement(), detectVehicleCheat)

WeaponID = {
    [35] = true,
    [36] = true,
    [38] = true,
}

function detectWeaponCheat(previousWeaponID, currentWeaponID)
  if ( WeaponID[currentWeaponID] ) then
    if not hasObjectPermissionTo ( source, "function.mute" ) then
        kickPlayer(source, "[AC] : Weapon Hack")
    end
  end
end
addEventHandler("onPlayerWeaponSwitch", getRootElement(), detectWeaponCheat)
