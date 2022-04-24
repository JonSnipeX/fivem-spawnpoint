Citizen.CreateThread(function()     
    while true do         
        Citizen.Wait(0) 
        
        local player = GetPlayerPed(-1)

        if IsControlPressed(0, 226) and IsControlJustPressed(0, 42) or IsControlJustPressed(0, 226) and IsControlPressed(0, 42) then
         if not IsPedInAnyVehicle(player, false) then
          ShowNotification("~r~[Error] ~c~You are not in a Vehicle")
          end

        if IsPedInAnyVehicle(player, false) then
             isTrue = true
             coords = GetEntityCoords(player)
             heading = GetEntityHeading(player)
             ShowNotification("~g~[Success] ~c~Set Spawnpoint")
             end
            end

        if IsControlPressed(0, 226) and IsControlJustPressed(0, 43) or IsControlJustPressed(0, 226) and IsControlPressed(0, 43) then
        
        if IsPedInAnyVehicle(player, false) then
         if isTrue == true then
         FreezeEntityPosition(player, true)
         FreezeEntityPosition(player, false)
         SetEntityCoords(GetVehiclePedIsUsing(player), coords.x, coords.y, coords.z)
         SetEntityHeading(GetVehiclePedIsUsing(player), heading)
         ShowNotification("~g~[Success]                                          ~c~Returned to Spawnpoint")
         end
         end
        
         if not isTrue then
          ShowNotification("~r~[Error] ~c~Spawnpoint is not set")
          end

        if not IsPedInAnyVehicle(player, false) then
         ShowNotification("~r~[Error] ~c~You are not in a Vehicle")
         end
        end
       end
      end)


  function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
