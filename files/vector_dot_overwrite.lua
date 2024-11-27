--[[
--- Benchmark complete
On Server
reps	20	rounds	30000
vec:Dot old	1.2875416667678e-07
vec:Dot new	5.2033999999855e-07
--]]

function vecDot(a, b)
    return a.x * b.x + a.y * b.y + a.z * b.z
end

local n, n2

LuctusCompareOften(20,0.1,30000,{
    {"",function()
        n = Vector(math.random(),math.random(),math.random())
        n2 = Vector(math.random(),math.random(),math.random())
    end},
    {"vec:Dot old",function()
        return n:Dot(n2)
    end},
    {"vec:Dot new",function()
        return vecDot(n,n2)
    end},
})
