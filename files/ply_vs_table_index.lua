--[[
Runs:	1000	1000
ply:	0.0033284901999953
tab:	0.0016247142000013
--]]

local pt = {}
local tt = {}

for i=1,1000 do
    local testab = {}
    for i=1,10000 do
      testab[i] = math.random(1,999999)
    end

    local a = nil
    for k,v in pairs(testab) do
        a = v
    end

    local ss = SysTime()
    for k,v in pairs(testab) do
        Entity(1)[v]=k
    end
    for k,v in pairs(testab) do
        a = Entity(1)[v]
    end
    table.insert(pt,SysTime()-ss)

    local plytab = {}
    plytab[Entity(1)] = {}
    local ss = SysTime()
    for k,v in pairs(testab) do
        plytab[Entity(1)][v]=k
    end
    for k,v in pairs(testab) do
        a = plytab[Entity(1)][v]
    end
    table.insert(tt,SysTime()-ss)
end

print("Runs:",#pt,#tt)

a = 0
for k,v in ipairs(pt) do
    a = a + v
end
print("ply:",a/#pt)

a = 0
for k,v in ipairs(tt) do
    a = a + v
end
print("tab:",a/#tt)
