--[[
Tests: first=10000 / second=10000
surface box: 7.4713099996529e-06
draw box: 8.9259399998298e-06
Tests: first=10000 / second=10000
surface box: 7.4859800010245e-06
draw box: 8.335099999681e-06
--]]

hook.Add("OnPlayerChat","luctus_fps_test",function(ply,text,team,dead)
  if text == "first" then
    timer.Simple(2,luctusTestFirst)
  end
  if text == "second" then
    timer.Simple(2,luctusTestSecond)
  end
  if text == "result" then
    local lRes = 0
    local nRes = 0
    for k,v in pairs(testDataSecond) do
      lRes = lRes + v
    end
    for k,v in pairs(testDataFirst) do
      nRes = nRes + v
    end
    chat.AddText("Tests: first="..#testDataFirst.." / second="..#testDataSecond) --checking if each ran 10000 times
    chat.AddText("surface box: "..(nRes/#testDataFirst))
    chat.AddText("draw box: "..(lRes/#testDataSecond))
  end
end)

testDataFirst = {}
testDataSecond = {}
local color_red = Color(255,0,0)
local color_green = Color(0,255,0)
local color_blue = Color(0,0,255)

function luctusTestFirst()
  local i = 0
  hook.Add("HUDPaint","luctus_test_1",function()
    local ss = SysTime()
    surface.SetDrawColor(255,0,0)
    surface.DrawRect(500,500,500,500)
    surface.SetDrawColor(0,255,0)
    surface.DrawRect(200,200,200,200)
    surface.SetDrawColor(0,0,255)
    surface.DrawRect(10,10,10,10)
    table.insert(testDataFirst,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_test_1") end
  end)
end

function luctusTestSecond()
  local i = 0
  hook.Add("HUDPaint","luctus_test_2",function()
    local ss = SysTime()
    draw.RoundedBox(0, 500, 500, 500, 500, color_red)
    draw.RoundedBox(0, 200, 200, 200, 200, color_green)
    draw.RoundedBox(0, 10, 10, 10, 10, color_blue)
    table.insert(testDataSecond,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_test_2") end
  end)
end
