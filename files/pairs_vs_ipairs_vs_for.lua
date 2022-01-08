local testab = {}
for i=1,10000 do
  testab[math.random()] = math.random()
end

local a = nil
local ss = SysTime()
for k,v in pairs(testab) do
  a = k..v
end
local es = SysTime()
print("pairs: "..(es-ss))
print(a)
local ss = SysTime()
for k,v in ipairs(testab) do
  a = k..v
end
local es = SysTime()
print("ipairs: "..(es-ss))
print(a)
local ss = SysTime()
for i=1, #testab do
  a = i..testab[i]
end
local es = SysTime()
print("i=1: "..(es-ss))
print(a)
