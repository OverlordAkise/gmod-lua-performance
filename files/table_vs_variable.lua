
gglc = {}
gglc.c = {}
gglc.c.col = 342
gglcccol = 342

local a = nil
local st = SysTime()
a = gglc.c.col
local et = SysTime()
print("tab:",et-st)

local a = nil
local st = SysTime()
a = gglcccol
local et = SysTime()
print("var:",et-st)

--Older code:

--[[
--Tests: var=10000 / tab=10000
--var: 4.3992899999012e-06
--tab: 6.68657000042e-06


hook.Add("OnPlayerChat","luctus_fps_test",function(ply,text,team,dead)
  if text == "test" then
    timer.Simple(2,triggerTabTest)--no difference in order here
    timer.Simple(2,triggerVarTest)
  end
  if text == "result" then
    local vRes = 0
    local tRes = 0
    for k,v in pairs(var_frametimes) do
      vRes = vRes + v
    end
    for k,v in pairs(tab_frametimes) do
      tRes = tRes + v
    end
    chat.AddText("Tests: var="..#var_frametimes.." / tab="..#tab_frametimes)
    chat.AddText("var: "..(vRes/#var_frametimes))
    chat.AddText("tab: "..(tRes/#tab_frametimes))
  end
end)

lc = {}
lc.c = {}
lc.c.col = Color(255,200,0)

lcccol = Color(255,200,0)

var_frametimes = {}
tab_frametimes = {}

function triggerTabTest()
  local i = 0
  hook.Add("HUDPaint","luctus_fps_test_tab",function()
    local ss = SysTime()
    draw.RoundedBox(0, 500, 500, 500, 500, lc.c.col )
    draw.RoundedBox(0, 200, 200, 200, 200, lc.c.col )
    draw.RoundedBox(0, 10, 10, 10, 10, lc.c.col )
    table.insert(tab_frametimes,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_fps_test_tab") end
  end)
end

function triggerVarTest()
  local i = 0
  hook.Add("HUDPaint","luctus_fps_test_var",function()
    local ss = SysTime()
    draw.RoundedBox(0, 500, 500, 500, 500, lcccol )
    draw.RoundedBox(0, 200, 200, 200, 200, lcccol )
    draw.RoundedBox(0, 10, 10, 10, 10, lcccol )
    table.insert(var_frametimes,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_fps_test_var") end
  end)
end
