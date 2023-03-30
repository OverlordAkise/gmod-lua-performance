
local res1 = {}
local res2 = {}

local a = 0
local tab = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q"}

for i=1,10000 do
  local ss = SysTime()
  a = #tab
  local es = SysTime()
  table.insert(res1,es-ss)
  
  local ss = SysTime()
  a = table.Count(tab)
  local es = SysTime()
  table.insert(res2,es-ss)
  
  tab = {}
  for i=1,math.Rand(1,10) do
    table.insert(tab,math.random())
  end
end

local b = 0
for k,v in pairs(res1) do
  b = b + v
end
print("Hashtag: "..(b/#res1))
local c = 0
for k,v in pairs(res2) do
  c = c + v
end
print("TbCount: "..(c/#res2))
