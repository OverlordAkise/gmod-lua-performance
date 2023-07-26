

local PLY = FindMetaTable("Player")
function PLY:GetCash(a)
    return self.mul*a
end

function GetCash(ply,a)
    return ply.mul*a
end

local a = 0
local b = 0
local at = {}
local bt = {}

for i=1,100 do

    Entity(1).mul = math.random()
    local num = math.random()

    ss = SysTime()
    for i=1,100000 do
        a = Entity(1):GetCash(num)
    end
    es = SysTime()
    table.insert(at,(es-ss))

    ss = SysTime()
    for i=1,100000 do
        b = GetCash(Entity(1),num)
    end
    es = SysTime()
    table.insert(bt,(es-ss))
end

local s = 0
for k,v in pairs(at) do
    s = s + v
end
print("meta: "..(s/#at))

local s = 0
for k,v in pairs(bt) do
    s = s + v
end
print("none: "..(s/#bt))
