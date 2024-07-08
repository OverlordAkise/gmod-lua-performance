--[[
--- Benchmark complete
On Server
reps	20	rounds	50000
clamp  	6.9868600001882e-08
max/min	6.806609987666e-08
--- Benchmark complete
On Client
reps	20	rounds	50000
clamp  	6.9836399990663e-08
max/min	6.7090800087044e-08
--]]

local num,low,high
local resClamp
local resMaxMn

LuctusCompareOften(20,0.1,50000,{
    {"", function()
        if resClamp != resMaxMn then error("RESULT DIFFERENCE") end
        num,low,high = math.random(),math.random(),math.random()
    end},
    {"clamp  ",function()
        resClamp = math.Clamp(num,low,high)
    end},
    {"max/min",function()
        resMaxMn = math.min(math.max(num,low),high)
    end},
})
