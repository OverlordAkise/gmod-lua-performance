
local color_white_local = Color(255,255,255,255)
local color_black_local = Color(0,0,0,255)
local mytext = "test"

local c = 1
hook.Add("HUDPaint","testdraw",function()
    c = c + 1
    if c >= 10 then hook.Remove("HUDPaint","testdraw") end
    local a = SysTime()
    local z = SysTime()
    a = SysTime()
    surface.SetTextColor(255,255,255)
    surface.SetFont("DermaLarge")
    surface.SetTextPos(500,500)
    surface.DrawText(mytext)
    surface.SetFont("Default")
    surface.SetTextPos(200,200)
    surface.DrawText(mytext)
    surface.SetFont("Trebuchet24")
    surface.SetTextPos(10,10)
    surface.DrawText(mytext)
    z = SysTime()
    print("surface funcs",z-a)
    a = SysTime()
    draw.DrawText(mytext,"DermaLarge",500,500,color_white_local,TEXT_ALIGN_LEFT)
    draw.DrawText(mytext,"Default",200,200,color_white_local,TEXT_ALIGN_LEFT)
    draw.DrawText(mytext,"Trebuchet24",10,10,color_white_local,TEXT_ALIGN_LEFT)
    z = SysTime()
    print("drawtext",z-a)
    a = SysTime()
    draw.SimpleText(mytext,"DermaLarge",500,500,color_white_local,TEXT_ALIGN_LEFT)
    draw.SimpleText(mytext,"Default",200,200,color_white_local,TEXT_ALIGN_LEFT)
    draw.SimpleText(mytext,"Trebuchet24",10,10,color_white_local,TEXT_ALIGN_LEFT)
    z = SysTime()
    print("simpletext",z-a)
    a = SysTime()
    draw.SimpleTextOutlined(mytext,"DermaLarge",500,500,color_white_local,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,1,color_black_local)
    draw.SimpleTextOutlined(mytext,"Default",200,200,color_white_local,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,1,color_black_local)
    draw.SimpleTextOutlined(mytext,"Trebuchet24",10,10,color_white_local,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,1,color_black_local)
    z = SysTime()
    print("simpletext++",z-a)
end)


--Old code:


--[[
--Tests: first=10000 / second=10000
--surface text: 4.4425630000087e-05
--draw text: 5.7772090000029e-05
--Tests: first=10000 / second=10000
--surface text: 4.2920899998398e-05
--draw text: 5.8662150001328e-05


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
    chat.AddText("surface text: "..(nRes/#testDataFirst))
    chat.AddText("draw text: "..(lRes/#testDataSecond))
  end
end)

testDataFirst = {}
testDataSecond = {}
local color_white_local = Color(255,255,255)
local mytext = "Test message here"

function luctusTestFirst()
  local i = 0
  hook.Add("HUDPaint","luctus_test_1",function()
    local ss = SysTime()
    surface.SetTextColor(255,255,255)
    surface.SetFont("DermaLarge")
    surface.SetTextPos(500,500)
    surface.DrawText(mytext)
    surface.SetFont("Default")
    surface.SetTextPos(200,200)
    surface.DrawText(mytext)
    surface.SetFont("Trebuchet24")
    surface.SetTextPos(10,10)
    surface.DrawText(mytext)
    table.insert(testDataFirst,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_test_1") end
  end)
end

function luctusTestSecond()
  local i = 0
  hook.Add("HUDPaint","luctus_test_2",function()
    local ss = SysTime()
    draw.DrawText(mytext,"DermaLarge",500,500,color_white_local,TEXT_ALIGN_LEFT)
    draw.DrawText(mytext,"Default",200,200,color_white_local,TEXT_ALIGN_LEFT)
    draw.DrawText(mytext,"Trebuchet24",10,10,color_white_local,TEXT_ALIGN_LEFT)
    table.insert(testDataSecond,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_test_2") end
  end)
end
--]]
