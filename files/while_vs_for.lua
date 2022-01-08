at = {}
bt = {}

for i=1,10000 do
  intab = {}
  for i=1,10000 do
    table.insert(intab,math.random())
  end
  
  ss = SysTime()
  local i = 10000
  while (i > 0) do
    i = i - 1
    local x = i
  end
  es = SysTime()
  table.insert(at,(es-ss))
  
  ss = SysTime()
  for i=1,10000 do
    local x = i
  end
  es = SysTime()
  table.insert(bt,(es-ss))
end

local s = 0
for k,v in pairs(at) do
  s = s + v
end
print("while: "..(s/#at))
local s = 0
for k,v in pairs(bt) do
  s = s + v
end
print("for: "..(s/#bt))
