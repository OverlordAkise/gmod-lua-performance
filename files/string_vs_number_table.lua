
local strtab = {}
local strtabbig = {}
local inttab = {}
local inttabuns = {}

LuctusCompareOften(5,0.2,1000,{
    {"",function()
        strtab = {}
        strtabbig = {}
        inttab = {}
        inttabuns = {}
        for i=1,100 do
            local num = math.random()
            strtab[ranStr(5)] = num
            strtabbig[ranStr(20)] = num
            inttab[i] = num
            inttabuns[ranInt()] = num
        end
    end},
    {"short string pairs",function()
        local a = 0
        for k,v in pairs(strtab) do
            a = a + v
        end
        return a
    end},
    {"big   string pairs",function()
        local a = 0
        for k,v in pairs(strtabbig) do
            a = a + v
        end
        return a
    end},
    {"sequent  int pairs",function()
        local a = 0
        for k,v in pairs(inttab) do
            a = a + v
        end
        return a
    end},
    {"sequent int ipairs",function()
        local a = 0
        for k,v in ipairs(inttab) do
            a = a + v
        end
        return a
    end},
    {"unsorted int pairs",function()
        local a = 0
        for k,v in pairs(inttabuns) do
            a = a + v
        end
        return a
    end},
})
