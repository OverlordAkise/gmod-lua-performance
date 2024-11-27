--[[
--- Benchmark complete
On Server
reps	20	rounds	10000
small old	4.6385350004698e-07
small new	1.2625500000013e-07
big old	    3.1202909999735e-06
big new	    1.2906200004807e-07
--]]

local rand = math.Rand
function tableRandom(t)
    local rand_index = rand(1, #t)
    return t[rand_index]
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
    {"small old",function()
        return table.Random(small)
    end},
    {"small new",function()
        return tableRandom(small)
    end},
    {"big old",function()
        return table.Random(big)
    end},
    {"big new",function()
        return tableRandom(big)
    end},
})
