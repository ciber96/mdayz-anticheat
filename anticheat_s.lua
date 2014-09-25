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
    if vHealth >= 12001 then
        setElementData(thePlayer, "blood", 12000)
        kickPlayer(thePlayer, "[AC] : Health Hack")
    end
end

function checkFood(thePlayer)
    local vFood = getElementData(thePlayer, "food") or 0
    if vFood >= 101 then
        setElementData(thePlayer, "food", 30)
        kickPlayer(thePlayer, "[AC] : Food Hack")
    end
end

function checkThirst(thePlayer)
    local vFood = getElementData(thePlayer, "thirst") or 0
    if vFood >= 101 then
        setElementData(thePlayer, "thirst", 30)
        kickPlayer(thePlayer, "[AC] : Thirst Hack")
    end
end

function checkSlots(thePlayer)
    local vSlots = getElementData(thePlayer, "MAX_Slots") or 0
    if vSlots >= 50 then
        setElementData(thePlayer, "MAX_Slots", 0)
        kickPlayer(thePlayer, "[AC] : Slots Hack")
    end
end

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
    if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(source)), aclGetGroup ( "Everyone" ) ) then
        kickPlayer(source, "[AC] : Weapon Hack")
    end
  end
end
addEventHandler("onPlayerWeaponSwitch", getRootElement(), detectWeaponCheat)
