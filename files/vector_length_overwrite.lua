--[[
--- Benchmark complete
On Server
reps	20	rounds	30000
vec:Length old	1.1400050000068e-07
vec:Length new	3.8188000000545e-07
--]]

local vec = FindMetaTable("Vector")
function vec:NewLength()
    local x, y, z = self.x, self.y, self.z
	return (x * x + y * y + z * z) ^ .5
end

local n

LuctusCompareOften(20,0.1,30000,{
    {"",function()
        n = Vector(math.random(),math.random(),math.random())
    end},
    {"vec:Length old",function()
        return n:Length()
    end},
    {"vec:Length new",function()
        return n:NewLength()
    end},
})
