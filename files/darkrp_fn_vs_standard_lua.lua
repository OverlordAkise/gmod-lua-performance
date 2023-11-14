
--This piece of code gets the darkrp command for the first word of a chat comand
--Example: "!say hello" as input would return "say" from both of these functions below

--DarkRP's way of doing this defines a function and executes it, which could be the reason that it is slower
--BUT: It does this for every chat message sent, which is why I included this overhead in the benchmark

--[[
--- Benchmark complete
On Server
reps	10	rounds	1000
darkrp 	7.9022700008863e-06
default	8.2877000014605e-07
--]]

local a = ""
local textin = ""
LuctusCompareOften(10,0.1,1000,{
    {"",function()
        textin = "!"..ranStr(7).." "..ranStr(7)
    end},
    {"darkrp ",function()
        a = fn.Compose{ -- Extract the chat command
            DarkRP.getChatCommand,
            string.lower,
            fn.Curry(fn.Flip(string.sub), 2)(2), -- extract prefix
            fn.Curry(fn.GetValue, 2)(1), -- Get the first word
            fn.Curry(string.Explode, 2)(' ') -- split by spaces
        }(textin)
    end},
    {"default",function()
        a = DarkRP.getChatCommand(string.lower(string.Explode(string.sub(textin,2)," ")[1]))
    end},
})
