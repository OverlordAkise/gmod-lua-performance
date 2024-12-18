--[[
--- Benchmark complete
On Server
reps	10	rounds	10000
pairs 	2.7375729999562e-06
ipairs	2.5955539999833e-06
for #t	2.5866950000025e-06
iter 	1.7860300003008e-07
--]]
local res
LuctusCompareOften(10,0.1,10000,{
    {"pairs ",function()
        for k,v in pairs(player.GetAll()) do res = v end
    end},
    {"ipairs",function()
        for k,v in ipairs(player.GetAll()) do res = v end
    end},
    {"for #t",function()
        local p = player.GetAll() for i=1,#p do res = p[i] end
    end},
    {"iter ",function()
        for k,v in player.Iterator() do res = v end
    end},
})
