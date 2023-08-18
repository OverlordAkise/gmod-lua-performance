
--To run this example you need luctus_benchmark.lua loaded

LuctusCompareOften(10,0.2,1000,{
    {"concat str",function() local a = ranStr().."("..ranStr()..") bought "..ranStr() end},
    {"format str",function() local a = string.format("%s(%s) bought %s",ranStr(),ranStr(),ranStr()) end},
    {"concat int",function() local a = ranStr().."("..ranStr()..") bought "..ranInt().."x "..ranStr() end},
    {"format int",function() local a = string.format("%s(%s) bought %ix %s",ranStr(),ranStr(),ranInt(),ranStr()) end},
})
