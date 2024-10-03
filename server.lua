local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","admPauseMenu")

RegisterServerEvent("MenuQuit")
AddEventHandler("MenuQuit", function()
    local source = source
    DropPlayer(source, "Speram sa te revedem")
end)

