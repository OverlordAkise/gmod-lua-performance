--[[
--- Benchmark complete
On Server
reps	20	rounds	30000
math.Round old	7.1794499987448e-08
math.Round new	6.0206499994801e-08
--]]

local floor = math.floor
local mathRound = function(num, idp)
    local mult = 10 ^ (idp or 0)
    return floor(num * mult + 0.5) / mult
end

local n

LuctusCompareOften(20,0.1,30000,{
    {"",function()
        n = math.random()
    end},
    {"math.Round old",function()
        return math.Round(n)
    end},
    {"math.Round new",function()
        return mathRound(n)
    end},
})
