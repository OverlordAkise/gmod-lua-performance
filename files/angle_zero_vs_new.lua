--[[
--- Benchmark complete
On Server
reps	30	rounds	5000
Zero'd	1.3485066712595e-07
Create	2.3365133318293e-07
--- Benchmark complete
On Client
reps	30	rounds	5000
Zero'd	1.1277866673481e-07
Create	2.4979333345679e-07
--]]

local ang = Angle(0,0,0)
LuctusCompareOften(30,0.1,5000,{
    {"Zero'd",function()
        ang:Zero()
        return ang
    end},
    {"Create",function()
        return Angle(0,0,0)
    end},
})
