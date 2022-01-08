
--Warning: This takes a few seconds to calculate! Game may freeze!

a = 0
b = 0
at = {}
bt = {}

for i=1,100 do
  intab = {}
  for i=1,1000000 do
    table.insert(intab,math.random())
  end

  ss = SysTime()
  for i=1,1000000 do
    a = intab[i] * 0.5
  end
  es = SysTime()
  table.insert(at,(es-ss))

  ss = SysTime()
  for i=1,1000000 do
    b = intab[i] / 2
  end
  es = SysTime()
  table.insert(bt,(es-ss))
end

local s = 0
for k,v in pairs(at) do
  s = s + v
end
print("Multiplication: "..(s/#at))
local s = 0
for k,v in pairs(bt) do
  s = s + v
end
print("Division: "..(s/#bt))
