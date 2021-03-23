
XD = nil

Citizen.CreateThread(function() 
    while XD == nil do
        TriggerEvent(Framework, function(obj) XD = obj end)    
        Citizen.Wait(200)
    end
end)

GetItemInfo = "XD:GetItemInfo"