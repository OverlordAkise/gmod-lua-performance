--[[
Tests: nw=10000 / rp=10000
NW: 2.3140229998944e-05
RP: 2.494706000125e-05
--]]

--First type "nw" and wait for the squares to vanish, then type "rp" and wait again - after they vanish too type "result"
--Im lazy and this is an easy test setup (same as hudpaint_3call_cache.lua)

hook.Add("OnPlayerChat","luctus_fps_test",function(ply,text,team,dead)
  if text == "nw" then
    timer.Simple(2,triggerNWTest)
  end
  if text == "rp" then
    timer.Simple(2,triggerRPTest)
  end
  if text == "result" then
    local lRes = 0
    local nRes = 0
    for k,v in pairs(nw_frametimes) do
      lRes = lRes + v
    end
    for k,v in pairs(rp_frametimes) do
      nRes = nRes + v
    end
    chat.AddText("Tests: nw="..#nw_frametimes.." / rp="..#rp_frametimes)
    chat.AddText("NW: "..(lRes/#nw_frametimes))
    chat.AddText("RP: "..(nRes/#rp_frametimes))
  end
end)

rp_frametimes = {}
nw_frametimes = {}

function triggerRPTest()
  local i = 0
  hook.Add("HUDPaint","luctus_fps_test_rp",function()
    local ss = SysTime()
    draw.DrawText(LocalPlayer():getDarkRPVar("job"), "DermaDefault",500, 500, color_white, TEXT_ALIGN_LEFT)
    draw.DrawText(LocalPlayer():getDarkRPVar("job"), "DermaDefault",200, 200, color_white, TEXT_ALIGN_LEFT)
    draw.DrawText(LocalPlayer():getDarkRPVar("job"), "DermaDefault",100, 100, color_white, TEXT_ALIGN_LEFT)
    table.insert(rp_frametimes,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_fps_test_rp") end
  end)
end

function triggerNWTest()
  local i = 0
  hook.Add("HUDPaint","luctus_fps_test_nw",function()
    local ss = SysTime()
    draw.DrawText(LocalPlayer():GetNWString("job"), "DermaDefault",500, 500, color_white, TEXT_ALIGN_LEFT)
    draw.DrawText(LocalPlayer():GetNWString("job"), "DermaDefault",200, 200, color_white, TEXT_ALIGN_LEFT)
    draw.DrawText(LocalPlayer():GetNWString("job"), "DermaDefault",10, 10, color_white, TEXT_ALIGN_LEFT)
    table.insert(nw_frametimes,SysTime()-ss)
    i = i + 1
    if i == 10000 then hook.Remove("HUDPaint", "luctus_fps_test_nw") end
  end)
end
