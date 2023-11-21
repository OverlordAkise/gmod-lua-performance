
--[[
--- Benchmark complete
On Server
reps	10	rounds	10000
table = { x = y,	4.5506299968565e-07
table.x = y      	6.2055800030748e-07
--]]

LuctusCompareOften(10,0.1,10000,{
    {"table = { x = y,",function()
        local tab = {
            a = ranInt(),
            b = ranInt(),
            c = ranInt(),
            d = ranInt(),
            e = ranInt(),
        }
        return tab
    end},
    {"table.x = y      ",function()
        local tab = {}
        tab.a = ranInt()
        tab.b = ranInt()
        tab.c = ranInt()
        tab.d = ranInt()
        tab.e = ranInt()
        return tab
    end},
})
