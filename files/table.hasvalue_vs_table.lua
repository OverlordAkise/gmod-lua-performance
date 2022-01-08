local HasValue = {"superadmin","admin","moderator"}
local InTable = {
  ["superadmin"] = true,
  ["admin"] = true,
  ["moderator"] = true,
}
local isAdmin = nil

local ss = SysTime()
for i=1,1000000 do
  isAdmin = table.HasValue(HasValue,"moderator")
end
local es = SysTime()
print("table.HasValue: "..(es-ss))

local ss = SysTime()
for i=1,1000000 do
  isAdmin = InTable["moderator"]
end
local es = SysTime()
print("table[x]: "..(es-ss))
