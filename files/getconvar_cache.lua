--[[
--- Benchmark complete
On Server
reps	20	rounds	1000
UnCached	2.0708000000838e-07
Cached  	2.1247999993221e-07
--]]

local GetConVar_Internal = GetConVar_Internal
local cache = {}
local NewGetConVar = function(name)
    if cache[name] == nil then
        local value = GetConVar_Internal(name)
        if value == nil then
            return
        end
        cache[name] = value
        return value
    end
    return cache[name]
end

LuctusCompareOften(20,0.1,1000,{
    {"UnCached",function()
        return GetConVar("sv_cheats"):GetInt()
    end},
    {"Cached  ",function()
        return NewGetConVar("sv_cheats"):GetInt()
    end},
})
