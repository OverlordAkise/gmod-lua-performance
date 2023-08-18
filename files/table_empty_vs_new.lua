
--Warning: Runtime > 15 seconds!!
local smallnumtable = {}
local bignumtable = {}
local smallstrtable = {}
local bigstrtable = {}
LuctusCompareOften(1,0.1,1000,{
    {"--",function() for i=1,10000 do table.insert(bignumtable,i) end end},
    {"--",function() for i=1,10 do table.insert(smallnumtable,i) end end},
    {"--",function() for i=1,10000 do bigstrtable[ranStr(14)] = i end end},
    {"--",function() for i=1,10 do smallstrtable[ranStr(14)] = i end end},
    {"table.Empty numerical on small",function() table.Empty(smallnumtable) end},
    {"table.Empty numerical on big  ",function() table.Empty(bignumtable) end},
    {"table.Empty stringind on small",function() table.Empty(smallstrtable) end},
    {"table.Empty stringind on big  ",function() table.Empty(bigstrtable) end},
    {"--",function() for i=1,10000 do table.insert(bignumtable,i) end end},
    {"--",function() for i=1,10 do table.insert(smallnumtable,i) end end},
    {"--",function() for i=1,10000 do bigstrtable[ranStr(14)] = i end end},
    {"--",function() for i=1,10 do smallstrtable[ranStr(14)] = i end end},
    {"table = {} numerical on small",function() smallnumtable = {} end},
    {"table = {} numerical on big  ",function() bignumtable = {} end},
    {"table = {} stringind on small",function() smallstrtable = {} end},
    {"table = {} stringind on big  ",function() bigstrtable = {} end},
    
})



-- Older code:

--[[

--# Tabsize 100000
--table.Empty	  0.00047110000002704
--tab = {}      0.000022799999953804  2.2799999953804e-05
  
--# Tabsize 10
--table.Empty   0.0000014999999962129   1.4999999962129e-06
--tab = {}      0.00000019999998812636  1.9999998812636e-07


local tabsize = 100000
local tab1 = {}
local tab2 = {}

for i=1,tabsize do
    table.insert(tab1,math.random())
    table.insert(tab2,math.random())
end

print("Tabsize",tabsize)
ss = SysTime()
table.Empty(tab1)
es = SysTime()
print("table.Empty",(es-ss))

ss = SysTime()
tab2 = {}
es = SysTime()
print("tab = {}",(es-ss))

--]]
