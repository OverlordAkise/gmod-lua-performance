--[[
--- Benchmark complete
On Server
reps	20	rounds	10000
count small old	2.7576250000664e-07
count small new	2.6563899996773e-07
count big old	1.8296299999935e-06
count big new	1.8260360000758e-06
--]]

function newTableCount(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

local small = {}
local big = {}

LuctusCompareOften(20,0.1,10000,{
    {"",function()
        small = {}
        big = {}
        for i=0,math.Rand(5,99) do
            table.insert(small,math.random())
        end
        for i=0,math.Rand(100,1000) do
            table.insert(big,math.random())
        end
    end},
    {"count small old",function()
        return table.Count(small)
    end},
    {"count small new",function()
        return newTableCount(small)
    end},
    {"count big old",function()
        return table.Count(big)
    end},
    {"count big new",function()
        return newTableCount(big)
    end},
})
