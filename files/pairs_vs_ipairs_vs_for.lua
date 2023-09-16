--[[ My result
--- Benchmark complete
reps	10	rounds	100
On Server
pairs 	7.4847200000647e-05
ipairs	1.0164499999632e-05
for #t	9.898100000953e-06
--]]

local testab = {}
LuctusCompareOften(10,0.1,100,{
    {"",function()
        testab = {}
        for i=1,10000 do
          testab[i] = math.random()
        end
    end},
    {"pairs ",function() local a = 0 for k,v in pairs(testab) do a = a + v end end},
    {"ipairs",function() local a = 0 for k,v in ipairs(testab) do a = a + v end end},
    {"for #t",function() local a = 0 for i=1, #testab do a = a + testab[i] end end},
})

--[[ OLD OUTPUT:

pairs:  6.7199999989498e-05
            5036.3684040894
ipairs: 7.9499999998234e-05
            5036.3684040894
i=1:    4.8999999989974e-05
            5036.3684040894
--]]

--[[
local testab = {}
for i=1,10000 do
  testab[i] = math.random()
end

local a = 0
local ss = SysTime()
for k,v in pairs(testab) do
  a = a+v
end
local es = SysTime()
print("pairs: "..(es-ss))
print(a)
local a = 0
local ss = SysTime()
for k,v in ipairs(testab) do
  a = a+v
end
local es = SysTime()
print("ipairs: "..(es-ss))
print(a)
local a = 0
local ss = SysTime()
for i=1, #testab do
  a = a+testab[i]
end
local es = SysTime()
print("i=1: "..(es-ss))
print(a)
--]]
