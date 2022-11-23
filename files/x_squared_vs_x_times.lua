at = {}
bt = {}
ct = {}

local ss = 0
local es = 0

for i=1,100 do
  intab = {}
  for i=1,10000 do
    table.insert(intab,math.random())
  end
  
  ss = SysTime()
  for i=1,10000 do
    local x = math.pow(intab[i],2) 
  end
  es = SysTime()
  table.insert(at,(es-ss))
  
  ss = SysTime()
  for i=1,10000 do
    local x = intab[i]^2
  end
  es = SysTime()
  table.insert(bt,(es-ss))
  
  ss = SysTime()
  for i=1,10000 do
    local x = intab[i]*intab[i]
  end
  es = SysTime()
  table.insert(ct,(es-ss))
end

local s = 0
for k,v in pairs(at) do
  s = s + v
end
print("x^2 math pow: "..(s/#at))

s = 0
for k,v in pairs(bt) do
  s = s + v
end
print("x^2 ^: "..(s/#bt))

s = 0
for k,v in pairs(ct) do
  s = s + v
end
print("x*x: "..(s/#ct))