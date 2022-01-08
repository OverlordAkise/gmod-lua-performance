
--Note: To run this code in LUA5.3 directly simply replace the SysTime() with os.clock()

local res1 = ""
local res2 = {}
local intab = {}

for i=1,10000 do
  table.insert(intab,math.random())
end

local ss = SysTime()
for i=1,10000 do
  res1 = res1 .. intab[i]
end
local es = SysTime()
print("String Concat: "..(es-ss))

local ss = SysTime()
for i=1,10000 do
  res2[#res2+1] = intab[i]
end
res2 = table.concat(res2)
local es = SysTime()
print("Table Concat: "..(es-ss))
