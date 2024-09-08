--[[
--- Benchmark complete
On Client
reps	20	rounds	10000
Cached	5.8824900024945e-07
Plain 	6.021605001348e-07
--]]

local ply
LuctusCompareOften(20,0.1,10000,{
    {"Cached",function()
        ply = ply or LocalPlayer()
        return ply:Nick()
    end},
    {"Plain ",function()
        return LocalPlayer():Nick()
    end},
})
