local res1 = {}
local res2 = {}
for i=1,10000 do
  local one = Vector(math.random(),math.random(),math.random())
  local two = Vector(math.random(),math.random(),math.random())

  local ss = SysTime()
  a = one:Distance(two)
  local es = SysTime()
  table.insert(res1,es-ss)
  
  local ss = SysTime()
  a = one:DistToSqr(two) 
  local es = SysTime()
  table.insert(res2,es-ss)
end

local b = 0
for k,v in pairs(res1) do
  b = b + v
end
print("Distance: "..(b/#res1))
local c = 0
for k,v in pairs(res2) do
  c = c + v
end
print("DistToSqr: "..(c/#res2))
