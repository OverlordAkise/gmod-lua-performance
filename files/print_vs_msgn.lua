
--This requires luctus_benchmark to be loaded

--Warning: Runtime of 90seconds

LuctusCompareOften(90,1,10,{
    {"Msg",function() Msg("test") end},
    {"print",function() print("test") end},
    {"MsgN",function() MsgN("test") end},
    {"Msg vars",function() Msg("test",3,"true") end},
    {"MsgN vars",function() MsgN("test",3,"true") end},
    {"print vars",function() print("test",3,"true") end},
    {"MsgN vars+tab",function() MsgN("test","\t",3,"\t","true") end},
})
