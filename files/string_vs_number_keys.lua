
local strtable = {}
local numtable = {}
local keysnum = {}
local keysstr = {}

-- This is a bit lossy since it's possible to have collisions, but the tables are identical anyway, so it shouldn't be an issue.
for i = 1, 100000 do
	local rand = ranStr(6)
	keysstr[i] = rand
	-- Packs the string into a number, basically. 6 bytes because 7 and 8 are not as easy to use. This still means strings should have the memory advantage however.
	-- This uses a loop in case you want to play with the size of the string.
	-- To reverse this (and check if it's true), loop from 1 to #rand, divide by the magic number and mod by 256
	local bytes = { string.byte(rand, 1, #rand) }
	local tonum = 0
	for j = #rand, 1, -1 do
		tonum = tonum + bytes[j] * 0x100 ^ (j - 1)
	end
	keysnum[i] = tonum
end

for k, v in ipairs(keysstr) do
	strtable[v] = k
end

for k, v in ipairs(keysnum) do
	numtable[v] = k
end

local sumnum = 0
local timenum = SysTime()
for _, v in ipairs(keysnum) do
	sumnum = sumnum + numtable[v]
end
timenum = SysTime() - timenum

local sumstr = 0
local timestr = SysTime()
for _, v in ipairs(keysstr) do
	sumstr = sumstr + strtable[v]
end
timestr = SysTime() - timestr

if sumnum ~= sumstr then print("Key-values in tables did not match!") end

print("numtable: " .. timenum)
print("strtable: " .. timestr)