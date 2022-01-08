
--Hint: This is made manually via chat so that I can control when to start/stop
--It also makes both tests start the same way: With the chatbox closing

hook.Add("OnPlayerChat","luctus_fps_test",function(ply,text,team,dead)
  if text == "local" then
    triggerLocalTest()
  end
  if text == "non" then
    triggerNonTest()
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
    chat.AddText("Tests: local="..#color_local_frametimes.." / non-local="..#color_non_frametimes)
    chat.AddText("Local: "..(lRes/#color_local_frametimes))
    chat.AddText("Non-Local: "..(nRes/#color_non_frametimes))
  end
end)


color_local_frametimes = {}
color_non_frametimes = {}

function triggerNonTest()
  local i = 0
  hook.Add("HUDPaint","luctus_fps_test_non",function()
    local ss = SysTime()
    draw.RoundedBox(0, 500, 500, 500, 500, Color(100,200,100) )
    draw.RoundedBox(0, 200, 200, 200, 200, Color(100,200,100) )
    draw.RoundedBox(0, 10, 10, 10, 10, Color(100,200,100) )
    table.insert(color_non_frametimes,SysTime()-ss)
    i = i + 1
    if i == 1000 then hook.Remove("HUDPaint", "luctus_fps_test_non") end
  end)
end

function triggerLocalTest()
  local i = 0
  local color_local = Color(100,200,100)
  hook.Add("HUDPaint","luctus_fps_test_local",function()
    local ss = SysTime()
    draw.RoundedBox(0, 500, 500, 500, 500, color_local )
    draw.RoundedBox(0, 200, 200, 200, 200, color_local )
    draw.RoundedBox(0, 10, 10, 10, 10, color_local )
    table.insert(color_local_frametimes,SysTime()-ss)
    i = i + 1
    if i == 1000 then hook.Remove("HUDPaint", "luctus_fps_test_local") end
  end)
end
