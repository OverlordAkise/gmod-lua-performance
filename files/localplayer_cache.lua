--[[
--- Benchmark complete
On Client
reps	20	rounds	50000
old LocalPlayer	7.4946100011402e-08
fastLocalPlayer	6.2921299662776e-08
--]]

local lcply = LocalPlayer()
function fastLocalPlayer()
    return lcply
end

LuctusCompareOften(20,0.1,50000,{
    {"old LocalPlayer",function()
        return LocalPlayer()
    end},
    {"fastLocalPlayer",function()
        return fastLocalPlayer()
    end},
})
