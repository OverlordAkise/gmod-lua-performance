
local tabsize = 100000
local tab1 = {}
local tab2 = {}

for i=1,tabsize do
    table.insert(tab1,math.random())
    table.insert(tab2,math.random())
end

print("Tabsize",tabsize)
ss = SysTime()
table.Empty(tab1)
es = SysTime()
print("table.Empty",(es-ss))

ss = SysTime()
tab2 = {}
es = SysTime()
print("tab = {}",(es-ss))
