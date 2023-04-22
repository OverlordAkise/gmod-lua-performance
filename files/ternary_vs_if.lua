local ifs = {}
local tns = {}
local a = nil
local aa = nil
local t = nil
local ss = nil
local es = nil

for i=1,1000000 do
  t = nil
  if math.random(1,100) < 50 then
    t = 7
  end
  
  a = nil
  aa = nil

  ss = SysTime()
  a = 1
  if t then
    a = 7
  end
  es = SysTime()
  table.insert(ifs,es-ss)
  
  ss = SysTime()
  aa = t and 7 or 1
  es = SysTime()
  table.insert(tns,es-ss)
       
  if aa != a then error("UNEQUAL") end
end

local sum = 0
for k,v in pairs(ifs) do
  sum = sum + v
end
print("if: "..(sum/#ifs))
sum = 0
for k,v in pairs(tns) do
  sum = sum + v
end
print("tn: "..(sum/#tns))
