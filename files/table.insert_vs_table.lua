local res1 = {}
local res2 = {}
local res3 = {}
local intab = {}
for i=1,1000000 do
  table.insert(intab,math.random())
end
local ss = SysTime()
for i=1,1000000 do
  table.insert(res1,intab[i])
end
local es = SysTime()
print("table.insert: "..(es-ss))

local lInsert = table.insert
local ss = SysTime()
for i=1,1000000 do
  lInsert(res2,intab[i])
end
local es = SysTime()
print("local table.insert: "..(es-ss))

local ss = SysTime()
for i=1,1000000 do
  res3[#res3+1] = intab[i]
end
local es = SysTime()
print("[#res+1]: "..(es-ss))
