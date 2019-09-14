------ MADE BY MAX F. ------
--FOR JUSTICE COMMUNITY RP--
----------------------------

RegisterNetEvent('HUDScript:TogglePLD')
RegisterNetEvent('HUDScript:ToggleVID')


togglePLD = true
toggleVID = true

local zones = { ['AIRP'] = 'Los Santos International Airport', ['ALAMO'] = 'Alamo Sea', ['ALTA'] = 'Alta', ['ARMYB'] = 'Fort Zancudo', ['BANHAMC'] = 'Banham Canyon Dr', ['BANNING'] = 'Banning', ['BEACH'] = 'Vespucci Beach', ['BHAMCA'] = 'Banham Canyon', ['BRADP'] = 'Braddock Pass', ['BRADT'] = 'Braddock Tunnel', ['BURTON'] = 'Burton', ['CALAFB'] = 'Calafia Bridge', ['CANNY'] = 'Raton Canyon', ['CCREAK'] = 'Cassidy Creek', ['CHAMH'] = 'Chamberlain Hills', ['CHIL'] = 'Vinewood Hills', ['CHU'] = 'Chumash', ['CMSW'] = 'Chiliad Mountain State Wilderness', ['CYPRE'] = 'Cypress Flats', ['DAVIS'] = 'Davis', ['DELBE'] = 'Del Perro Beach', ['DELPE'] = 'Del Perro', ['DELSOL'] = 'La Puerta', ['DESRT'] = 'Grand Senora Desert', ['DOWNT'] = 'Downtown', ['DTVINE'] = 'Downtown Vinewood', ['EAST_V'] = 'East Vinewood', ['EBURO'] = 'El Burro Heights', ['ELGORL'] = 'El Gordo Lighthouse', ['ELYSIAN'] = 'Elysian Island', ['GALFISH'] = 'Galilee', ['GOLF'] = 'GWC and Golfing Society', ['GRAPES'] = 'Grapeseed', ['GREATC'] = 'Great Chaparral', ['HARMO'] = 'Harmony', ['HAWICK'] = 'Hawick', ['HORS'] = 'Vinewood Racetrack', ['HUMLAB'] = 'Humane Labs and Research', ['JAIL'] = 'Bolingbroke Penitentiary', ['KOREAT'] = 'Little Seoul', ['LACT'] = 'Land Act Reservoir', ['LAGO'] = 'Lago Zancudo', ['LDAM'] = 'Land Act Dam', ['LEGSQU'] = 'Legion Square', ['LMESA'] = 'La Mesa', ['LOSPUER'] = 'La Puerta', ['MIRR'] = 'Mirror Park', ['MORN'] = 'Morningwood', ['MOVIE'] = 'Richards Majestic', ['MTCHIL'] = 'Mount Chiliad', ['MTGORDO'] = 'Mount Gordo', ['MTJOSE'] = 'Mount Josiah', ['MURRI'] = 'Murrieta Heights', ['NCHU'] = 'North Chumash', ['NOOSE'] = 'N.O.O.S.E', ['OCEANA'] = 'Pacific Ocean', ['PALCOV'] = 'Paleto Cove', ['PALETO'] = 'Paleto Bay', ['PALFOR'] = 'Paleto Forest', ['PALHIGH'] = 'Palomino Highlands', ['PALMPOW'] = 'Palmer-Taylor Power Station', ['PBLUFF'] = 'Pacific Bluffs', ['PBOX'] = 'Pillbox Hill', ['PROCOB'] = 'Procopio Beach', ['RANCHO'] = 'Rancho', ['RGLEN'] = 'Richman Glen', ['RICHM'] = 'Richman', ['ROCKF'] = 'Rockford Hills', ['RTRAK'] = 'Redwood Lights Track', ['SANAND'] = 'San Andreas', ['SANCHIA'] = 'San Chianski Mountain Range', ['SANDY'] = 'Sandy Shores', ['SKID'] = 'Mission Row', ['SLAB'] = 'Stab City', ['STAD'] = 'Maze Bank Arena', ['STRAW'] = 'Strawberry', ['TATAMO'] = 'Tataviam Mountains', ['TERMINA'] = 'Terminal', ['TEXTI'] = 'Textile City', ['TONGVAH'] = 'Tongva Hills', ['TONGVAV'] = 'Tongva Valley', ['VCANA'] = 'Vespucci Canals', ['VESP'] = 'Vespucci', ['VINE'] = 'Vinewood', ['WINDF'] = 'Ron Alternates Wind Farm', ['WVINE'] = 'West Vinewood', ['ZANCUDO'] = 'Zancudo River', ['ZP_ORT'] = 'Port of South Los Santos', ['ZQ_UAR'] = 'Davis Quartz' }

local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 


------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------FUNCTIONS----------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------


function _drawDirections(text, map)
    SetTextFont(4)
    SetTextScale(0.99, 0.99)
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(0.155 + map, 0.915)
end

function drawDirections(text, map)
	SetTextFont(4)
	SetTextCentre(true)
    SetTextScale(0.99, 0.99)
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(0.1811 + map, 0.915)
end

function drawText(x, y, scale, text, map)
    SetTextFont(4)
    SetTextScale(scale, scale)
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x + map, y)
end

function ShowNotification(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(true, false)
end


------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------Event Handlers-------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

AddEventHandler('HUDScript:TogglePLD', function()
	if togglePLD then
		ShowNotification('~r~Player Location Display was disabled')
		togglePLD = false
	else
		ShowNotification('~b~Player Location Display was enabled')
		togglePLD = true
	end
end)

AddEventHandler('HUDScript:ToggleVID', function()
	if toggleVID then
		ShowNotification('~r~Vehicle Information Display was disabled')
		toggleVID = false
	else
		ShowNotification('~b~Vehicle Information Display was enabled')
		toggleVID = true
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------Text Maker---------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsHudPreferenceSwitchedOn() then
			local pos = GetEntityCoords(PlayerPedId())
			local streetHash, _streetHash = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
	
			for k,v in pairs(directions)do
				direction = GetEntityHeading(PlayerPedId())
				if(math.abs(direction - k) < 22.5)then
					direction = v
					break;
				end
			end
	
			if IsBigmapActive() then
				map = 0.08
			elseif IsRadarHidden() then
				map = -0.141
			else
				map = 0
	
			end

			if togglePLD then
				if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z))then
					if(zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)))then
		
						_drawDirections('~m~[       ] ', map)
						drawDirections('~c~' .. direction, map)
						if(_streetHash ~= 0) then
							drawText(0.21, 0.919, 0.45, '~c~' .. GetStreetNameFromHashKey(streetHash) .. ' ~m~ / ~c~ ' .. GetStreetNameFromHashKey(_streetHash), map)
						else
							drawText(0.21, 0.919, 0.45, '~c~' .. GetStreetNameFromHashKey(streetHash), map)
						end
						drawText(0.21, 0.943, 0.45, '~m~' .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], map)
					end
				end
			end
			
			if toggleVID then
				if(IsPedInAnyVehicle(PlayerPedId(), false))then
					local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
					local class = GetVehicleClass(vehicle)
					local gear = GetVehicleCurrentGear(vehicle)
					local Model = GetLabelText(vehicle)
					local speedMP = GetEntitySpeed(vehicle) * 2.236936
					local speedKM = GetEntitySpeed(vehicle) * 3.6
					local speedKN = GetEntitySpeed(vehicle) * 1.94384
					local RPM = GetVehicleCurrentRpm(vehicle) * 10000 /1.6 -200 - GetEntitySpeed(vehicle)

					if class == 0 or class == 1 or class == 2 or class == 3 or class == 4 or class == 5 or class == 6 then --all vehicles excluding super, offroad, vas, trucks, boats, helis, plances, cycles and bikes
						local RPM = GetVehicleCurrentRpm(vehicle) * 10000 /1.5 -500 - GetEntitySpeed(vehicle)
						drawText(0.155, 0.83, 0.4, '~m~Vehicle Speed: ~c~' .. math.ceil(speedMP) .. ' MPH ~m~ | ~c~' .. math.ceil(speedKM) .. ' KPH', map)
						drawText(0.155, 0.86, 0.4, '~m~Vehicle Engine RPM: ~c~' .. math.ceil(RPM), map)
						drawText(0.155, 0.895, 0.4, '~m~Vehicle Transmission Gear: ~c~' .. math.ceil(gear), map)
					elseif class == 7 then --Super
						local RPM = GetVehicleCurrentRpm(vehicle) * 10000 /1.1 -800 - GetEntitySpeed(vehicle)
						drawText(0.155, 0.83, 0.4, '~m~Vehicle Model: ~c~' .. Model, map)
						drawText(0.155, 0.85, 0.4, '~m~Vehicle Speed: ~c~' .. math.ceil(speedMP) .. ' MPH ~m~ | ~c~' .. math.ceil(speedKM) .. ' KPH', map)
						drawText(0.155, 0.87, 0.4, '~m~Vehicle Engine RPM: ~c~' .. math.ceil(RPM), map)
						drawText(0.155, 0.89, 0.4, '~m~Vehicle Transmission Gear: ~c~' .. math.ceil(gear), map)
					elseif class == 9 or class == 11 or class == 12 or class == 19 then --off-road and vas
						local RPM = GetVehicleCurrentRpm(vehicle) * 10000 /1.98 -300 - GetEntitySpeed(vehicle)
						drawText(0.155, 0.83, 0.4, '~m~Vehicle Model: ~c~' .. Model, map)
						drawText(0.155, 0.85, 0.4, '~m~Vehicle Speed: ~c~' .. math.ceil(speedMP) .. ' MPH ~m~ | ~c~' .. math.ceil(speedKM) .. ' KPH', map)
						drawText(0.155, 0.87, 0.4, '~m~Vehicle Engine RPM: ~c~' .. math.ceil(RPM), map)
						drawText(0.155, 0.89, 0.4, '~m~Vehicle Transmission Gear: ~c~' .. math.ceil(gear), map)
					elseif class == 10 or class == 17 or class == 20 then --Utility
						local RPM = GetVehicleCurrentRpm(vehicle) * 10000 /4  - GetEntitySpeed(vehicle)
						drawText(0.155, 0.83, 0.4, '~m~Vehicle Model: ~c~' .. Model, map)
						drawText(0.155, 0.85, 0.4, '~m~Vehicle Speed: ~c~' .. math.ceil(speedMP) .. ' MPH ~m~ | ~c~' .. math.ceil(speedKM) .. ' KPH', map)
						drawText(0.155, 0.87, 0.4, '~m~Vehicle Engine RPM: ~c~' .. math.ceil(RPM), map)
						drawText(0.155, 0.89, 0.4, '~m~Vehicle Transmission Gear: ~c~' .. math.ceil(gear), map)
					elseif class == 8 then --bikes
						local RPM = GetVehicleCurrentRpm(vehicle) * 10000 * 1.3 - 923 - GetEntitySpeed(vehicle)
						drawText(0.155, 0.83, 0.4, '~m~Vehicle Model: ~c~' .. Model, map)
						drawText(0.155, 0.85, 0.4, '~m~Vehicle Speed: ~c~' .. math.ceil(speedMP) .. ' MPH ~m~ | ~c~' .. math.ceil(speedKM) .. ' KPH', map)
						drawText(0.155, 0.87, 0.4, '~m~Vehicle Engine RPM: ~c~' .. math.ceil(RPM), map)
						drawText(0.155, 0.89, 0.4, '~m~Vehicle Transmission Gear: ~c~' .. math.ceil(gear), map)
					elseif class == 14 or class == 15 or class == 16 then
						drawText(0.155, 0.83, 0.4, '~m~Vehicle Model: ~c~' .. Model, map)
						drawText(0.155, 0.85, 0.4, '~m~Vehicle Speed: ~c~' .. math.ceil(speedKN) .. ' Kn/Kt', map)
					end
				end
			end
		end
	end
end)