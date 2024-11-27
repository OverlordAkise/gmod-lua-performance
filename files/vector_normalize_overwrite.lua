--[[
--- Benchmark complete
On Server
reps	20	rounds	30000
vec:Normalize old	1.1955383335495e-07
vec:Normalize new	5.1291399999911e-07
--]]

function vecNormalize(v)
    local l = 1 / v:Length()
    v.x, v.y, v.z = v.x * l, v.y * l, v.z * l
end

local n

LuctusCompareOften(20,0.1,30000,{
    {"",function()
        n = Vector(math.random(),math.random(),math.random())
    end},
    {"vec:Normalize old",function()
        return n:Normalize()
    end},
    {"vec:Normalize new",function()
        return vecNormalize(n)
    end},
})
