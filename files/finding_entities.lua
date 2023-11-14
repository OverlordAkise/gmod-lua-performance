--[[
--- Benchmark complete
On Server
reps	10	rounds	10000
inPVS	2.2498948000473e-05
inBox	1.9315759995857e-06
Sphere	3.8246590005724e-06
Cone	1.6260100000977e-06
--]]

--
local minV = Vector(-128,-128,-5)
local maxV = Vector(128,128,64)
local cosRad15 = math.cos(math.rad(15))
local ply = Entity(1)

LuctusCompareOften(10,0.2,10000,{
    {"inPVS",function()
        return ents.FindInPVS(ply)
    end},
    {"inBox",function()
        local ipos = ply:GetPos()
        return ents.FindInBox(ipos+minV, ipos+maxV)
    end},
    {"Sphere",function()
        return ents.FindInSphere(ply:GetPos(),128)
    end},
    {"Cone",function()
        return ents.FindInCone(ply:EyePos(), ply:GetAimVector(), 128, cosRad15)
    end},
})
