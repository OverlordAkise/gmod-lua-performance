--[[
--- Benchmark complete
On Server
reps	20	rounds	50000
SteamID Classic	4.6951399998613e-07
SteamID Cached	7.0017300033214e-08
--- Benchmark complete
On Client
reps	20	rounds	50000
SteamID Classic	5.2189459993372e-07
SteamID Cached	6.247109999822e-08
--]]

local FPLAYER = FindMetaTable("Player")
local sids = {}
local ply = Entity(1)
sids[ply] = ply:SteamID()
function FPLAYER:SteamIDc()
    return sids[self]
end

LuctusCompareOften(20,0.1,50000,{
    {"SteamID Classic",function()
        return ply:SteamID()
    end},
    {"SteamID Cached",function()
        return ply:SteamIDc()
    end},
})
