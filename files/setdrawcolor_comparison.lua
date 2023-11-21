
--[[
--- Benchmark complete
On Client
reps	10	rounds	10000
SetColorFull	6.0781200035763e-07
SetColorSplit	1.1340800017479e-07
--]]

--This function is only for CLIENTside
if SERVER then return end

local mycolor = Color(0,0,0)
LuctusCompareOften(10,0.1,10000,{
    {"", function()
        mycolor = Color(math.random(0,255),math.random(0,255),math.random(0,255))
    end},
    {"SetColorFull",function()
        surface.SetDrawColor(mycolor)
    end},
    {"SetColorSplit",function()
        surface.SetDrawColor(mycolor.r,mycolor.g,mycolor.b)
    end},
})
