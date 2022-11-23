--[[
Tests: local=10000 / non-local=10000
Local: 6.777780000516e-06
Non-Local: 1.756282000116e-05
--]]

--First type "local" and wait for the squares to vanish, then type "non" and wait again - after they vanish too type "result"
--Im lazy and this is an easy test setup

hook.Add("OnPlayerChat","luctus_fps_test",function(ply,text,team,dead)
  if text == "local" then
    timer.Simple(2,triggerLocalTest)
  end
  if text == "non" then
    timer.Simple(2,triggerNonTest)
  end
  if text == "result" then
    local lRes = 0
    local nRes = 0
    for k,v in pairs(color_local_frametimes) do
      lRes = lRes + v
    end
    for k,v in pairs(color_non_frametimes) do
      nRes = nRes + v
    end
    chat.AddText("Tests: local="..#color_local_frametimes.." / non-local="..#color_non_frametimes) --checking if each ran 10000 times
    chat.AddText("Local: "..(lRes/#color_local_frametimes))
    chat.AddText("Non-Local: "..(nRes/#color_non_frametimes))
  end
end)

color_non_frametimes = {}
color_local_frametimes = {}

function triggerNonTest()
  local i = 0
  hook.Add("HUDPaint","luctus_fps_test_non",function()
    local ss = SysTime()
    draw.RoundedBox(0, LocalPlayer():Health(), 500, 500, 500, color_white )
    draw.RoundedBox(0, LocalPlayer():Health(), 200, 200, 200, color_white )
    draw.RoundedBox(0, LocalPlayer():Health(), 10, 10, 10, color_white )
    table.insert(color_non_frametimes,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_fps_test_non") end
  end)
end

function triggerLocalTest()
  local i = 0
  hook.Add("HUDPaint","luctus_fps_test_local",function()
    local ss = SysTime()
    local lph = LocalPlayer():Health()
    draw.RoundedBox(0, lph, 500, 500, 500, color_white )
    draw.RoundedBox(0, lph, 200, 200, 200, color_white )
    draw.RoundedBox(0, lph, 10, 10, 10, color_white )
    table.insert(color_local_frametimes,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_fps_test_local") end
  end)
end
