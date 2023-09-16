--Luctus Benchmark
--Made by OverlordAkise

--This is a very small and simple collection of functions for
--benchmarking lua functions for "time taken". It is nothing special

--[[ Example code

LuctusCompareOften( 10, 0.2, 10000, {
    {"darkrpvar", function() local a = Entity(1):getDarkRPVar("job") end},
    {"gmodnwvar", function() local a = Entity(1):GetNWString("job") end},
})

--The above code compares GetNWString function to getDarkRPVar

--]]

--source for ranStr: https://gist.github.com/haggen/2fd643ea9a261fea2094
local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
function ranStr(length)
    if not length then length = 8 end
    if length == 0 then return "" end
    local pos = math.random(1, #chars)
    return ranStr(length - 1) .. chars:sub(pos, pos)
end

function ranInt(maxInt)
    if not maxInt then maxInt = 999999 end
    return math.random(1,maxInt)
end

local intToKeep = 0
local getsRemaining = 0
function sameInt(keepFor)
    if keepFor then
        getsRemaining = keepFor
        intToKeep = ranInt()
        return intToKeep
    end
    if getsRemaining > 0 then
        getsRemaining = getsRemaining -1
        return intToKeep
    end
    error("How did we get here")
end

function ranFloat()
    return math.random()
end

function calcSum(tab)
    local sum = 0
    for i=1,#tab do
        sum = sum + tab[i]
    end
    return sum
end

function LuctusCompareOften(repeats,delay,rounds,tableOfFuncs)
    local results = {}
    local p = function()end
    timer.Create("LuctusBenchmark",delay,repeats,function()
        local res = LuctusCompare(rounds,tableOfFuncs,p)
        for i=1,#res do
            if not results[i] then results[i] = {} end
            table.insert(results[i],res[i])
        end
        if timer.RepsLeft("LuctusBenchmark") == 0 then
            print("--- Benchmark complete")
            print("reps",repeats,"rounds",rounds)
            print(SERVER and "On Server" or "On Client")
            for i=1,#results do
                local name = tableOfFuncs[i][1]
                if name == "" then continue end
                print(name,calcSum(results[i])/#results[i])
            end
        end
    end)
end

function LuctusCompare(rounds,tableOfFuncs,p)
    if not p then p = print end
    local funcCount = #tableOfFuncs
    local rv = {}
    local curFunc = 1
    --warmup
    for i=1,funcCount do
        tableOfFuncs[i][2]()
    end
    --run
    for i=1,rounds*funcCount do
        local func = tableOfFuncs[curFunc][2]
        local starttime = SysTime()
        func()
        local endtime = SysTime()
        if not rv[curFunc] then rv[curFunc] = {} end
        table.insert(rv[curFunc],endtime-starttime)
        curFunc = (curFunc%funcCount)+1
    end
    --result
    p("--- Benchmark complete")
    p("rounds",rounds)
    p(SERVER and "On Server" or "On Client")
    local result = {}
    for i=1,#rv do
        p(tableOfFuncs[i][1],calcSum(rv[i])/#rv[i])
        table.insert(result,calcSum(rv[i])/#rv[i])
    end
    return result
end

print("[luctus_benchmark] loaded")
