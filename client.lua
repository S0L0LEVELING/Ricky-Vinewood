-- Tech Development on top
-- https://discord.gg/tHAbhd94vS

local modelCreated = {}

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(modelCreated) do
            DeleteEntity(v)
        end
    end
end)

Citizen.CreateThread(function()
    for i=1, #Config.Text, 1 do 
        if i > 8 then 
            return 
        end
        local string = Config.Text:sub(i, i)
        string = string.lower(string)
        local coords = Config.Coords[i].coordinate
        local heading = Config.Coords[i].heading
        local model = string..string
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(1)
        end

        local obj = CreateObject(model, coords, false, false, false)
        SetEntityHeading(obj, heading)
        table.insert(modelCreated, obj)
    end
end)
