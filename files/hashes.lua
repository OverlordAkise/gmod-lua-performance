-- Hashes

--[[
--- Benchmark complete
On Server
reps	10	rounds	10000
CRC32	4.5670400035306e-07
MD5	    2.5526380002202e-06
SHA1	3.5287520001384e-06
SHA256	7.7691459993503e-06
Base64	4.1977299973951e-07
--]]

local input = ""
LuctusCompareOften(10,0.2,10000,{
    {"",function() input = ranStr() end},
    {"CRC32",function() util.CRC(input) end},
    {"MD5 ",function() util.MD5(input) end},
    {"SHA1",function() util.SHA1(input) end},
    {"SHA256",function() util.SHA256(input) end},
    {"Base64",function() util.Base64Encode(input) end},
})
