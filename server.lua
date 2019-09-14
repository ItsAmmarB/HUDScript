------ MADE BY MAX F. ------
--FOR JUSTICE COMMUNITY RP--
----------------------------



--------------------------------------------------
---------------REGISTERING  COMMAND---------------
--------------------------------------------------


RegisterCommand('togpld', function(source, args, rawCommand)
    TriggerClientEvent('HUDScript:TogglePLD', source) 
end, false)

RegisterCommand('togvid', function(source, args, rawCommand)
   TriggerClientEvent('HUDScript:ToggleVID', source) 
end, false)
