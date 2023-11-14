
-- This was tested with 3 bots

--This is a comparison between: 
-- - Calling a hook for every player
-- - Calling a hook with a list of every player

--[[
--- Benchmark complete
On Server
reps	10	rounds	10000
single	9.2695600087609e-07
many  	2.602249987649e-07

--]]


local t1 = {}
local t2 = {}
local t3 = {}
hook.Add("test_single","1",function(ply,num) t1[ply] = num end)
hook.Add("test_single","2",function(ply,num) t2[ply] = num end)
hook.Add("test_single","3",function(ply,num) t3[ply] = num end)
hook.Add("test_many","0",function(plys,num)
    for k,ply in ipairs(plys) do
        t1[ply] = num
        t2[ply] = num
        t3[ply] = num
    end
end)
local input = ""
local allplayers = player.GetAll()
LuctusCompareOften(10,0.1,10000,{
    {"",function() input = ranFloat() end},
    {"single",function()
        for k,ply in ipairs(allplayers) do
            hook.Run("test_single",ply,input)
        end
    end},
    {"many  ",function()
        hook.Run("test_many",allplayers,input)
    end},
})
