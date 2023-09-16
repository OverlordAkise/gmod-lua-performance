
function IsVal(ply)
    if ply.value == 3 then return true end
    return false
end

local PLAYER = FindMetaTable("Player")
function PLAYER:IsVal()
    if self.value == 3 then return true end
    return false
end

LuctusCompareOften(10,0.2,10000,{
    {"--",function() Entity(1).value = math.random(1,10) end},
    {"ply:IsVal()",function() local a = Entity(1):IsVal() end},
    {"IsVal(ply) ",function() local a = IsVal(Entity(1)) end},
})
