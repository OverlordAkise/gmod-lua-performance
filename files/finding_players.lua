--[[
--Tested with 40 bots + 1 player on a locally hosted game

--- Benchmark complete
On Server
reps	10	rounds	1000
FindInSphere	0.00011627801000012
PlyGetAllChk	1.9475780000045e-05
--- Benchmark complete
On Client
reps	10	rounds	1000
FindInSphere	8.301507999995e-05
PlyGetAllChk	2.4392489999832e-05
--]]

local ply = Entity(1)
local fEnts = {}
local pEnts = {}
local plyPos
LuctusCompareOften(10,0.2,1000,{
    {"",function()
        if #fEnts ~= #pEnts then error("UNEQUAL OUTPUT") end
    end},
    {"FindInSphere",function()
        fEnts = {}
        for k,ent in ipairs(ents.FindInSphere(ply:GetPos(),512)) do
            if ent:IsPlayer() then
                table.insert(fEnts,ent)
            end
        end
        return fEnts
    end},
    {"PlyGetAllChk",function()
        pEnts = {}
        plyPos = ply:GetPos()
        for k,plyEnt in ipairs(player.GetAll()) do
            if plyPos:Distance(plyEnt:GetPos()) < 512 then
                table.insert(pEnts,plyEnt)
            end
        end
        return pEnts
    end},
})
