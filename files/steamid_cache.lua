--[[
--- Benchmark complete
reps	20	rounds	50000
On Server
SteamID Classic	8.0880670002875e-07
SteamID Cached	3.1597380007656e-07
--- Benchmark complete
reps	20	rounds	50000
On Client
SteamID Classic	9.4334970010573e-07
SteamID Cached	3.3031949989709e-07
--]]

local FPLAYER = FindMetaTable("Player")
local ply = Entity(1)
ply.steamIDCached = ply:SteamID()
function FPLAYER:SteamIDc()
    return self.steamIDCached
end

LuctusCompareOften(20,0.1,50000,{
    {"SteamID Classic",function()
        return ply:SteamID()
    end},
    {"SteamID Cached",function()
        return ply:SteamIDc()
    end},
})
