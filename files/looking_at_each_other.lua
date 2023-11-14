--IsLookingAtEachOther calculation comparison
--https://wiki.facepunch.com/gmod/Vector:Dot

--For this benchmark to work you need atleast 2 players online
--This works with yourself + a bot

--[[
--- Benchmark complete
On Server
reps	5	rounds	100
AngleBetweenVectorsManual     	1.1895999687113e-06
AngleBetweenYawOnly           	6.7819999458152e-07
WikisLookingAtVecDotFunction	1.0634000118444e-06
DistanceBetweenNormVecManual	1.5873999782343e-06
DistanceBetweenNormVecAuto	    1.0834000095201e-06
DistanceBetweenAimVectors     	8.4879999485565e-07
--]]

--Taken from wiki Vector:Dot
function IsLookingAt(ply, ply2)
	local diff = ply2:GetShootPos() - ply:GetShootPos()
	return ply:GetAimVector():Dot(diff) / diff:Length() >= 0.95 
end

local ply1 = Entity(1)
local ply2 = Entity(2)

LuctusCompareOften(5,0.2,100,{
    {"",function()
        
    end},
    {"AngleBetweenVectorsManual     ",function()
        local a1 = ply1:GetAngles():Forward()
        local a2 = ply2:GetAngles():Forward()
        return math.acos((a1:Dot(a2))/(a1:Length()*a2:Length())) --1,57 = 90°
    end},
    {"AngleBetweenYawOnly           ",function()
        local phi = math.abs(ply1:GetAngles()[2] - ply2:GetAngles()[2]) % 360
        return phi > 180 and 360-phi or phi
    end},
    {"WikisLookingAtVecDotFunction",function()
        return IsLookingAt(ply1,ply2) and IsLookingAt(ply2,ply1)
    end},
    {"DistanceBetweenNormVecManual",function()
        local a1 = ply1:GetAngles():Forward()
        local a2 = ply2:GetAngles():Forward():GetNegated()
        return math.sqrt((a1.x-a2.x)^2 + (a1.y-a2.y)^2 + (a1.z-a2.z)^2)
    end},
    {"DistanceBetweenNormVecAuto ",function()
        local a1 = ply1:GetAngles():Forward()
        local a2 = ply2:GetAngles():Forward():GetNegated()
        return a1:Distance(a2)
    end},
    {"DistanceBetweenAimVectors     ",function()
        local a1 = ply1:GetAimVector()
        local a2 = ply2:GetAimVector():GetNegated()
        return a1:Distance(a2)
    end},
})
