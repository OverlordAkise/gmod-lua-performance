at = {}
bt = {}

for i=1,100 do
  intab = {}
  for i=1,10000 do
    table.insert(intab,math.random())
  end
  
  ss = SysTime()
  for i=1,10000 do
    local x = math.sin(intab[i]) 
  end
  es = SysTime()
  table.insert(at,(es-ss))
  
  local localSin = math.sin
  ss = SysTime()
  for i=1,10000 do
    local x = localSin(intab[i])
  end
  es = SysTime()
  table.insert(bt,(es-ss))
end

local s = 0
for k,v in pairs(at) do
  s = s + v
end
print("global math.sin: "..(s/#at))
local s = 0
for k,v in pairs(bt) do
  s = s + v
end
print("local math.sin: "..(s/#bt))
