--[[
--- Benchmark complete
On Server
reps	20	rounds	100
write old	0.00076962965000047
write new	0.00079238309999975
--]]

local function fileWrite(filename, contents)
    local f = file.Open(filename, "wb", "DATA")
    if not f then return end

    f:Write(contents)
    f:Close()
end

local n,n2

LuctusCompareOften(20,0.1,100,{
    {"",function()
        n = "temp/"..math.random()..".txt"
        n2 = "temp/"..math.random()..".txt"
    end},
    {"write old",function()
        return file.Write(n,n)
    end},
    {"write new",function()
        return fileWrite(n,n)
    end},
})