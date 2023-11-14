--Benchmark file.Read vs sql.Query

--[[
--- Benchmark complete
reps	20	rounds	100
On Server
file	0.00013605510000012
sql 	0.00014516330000007
--]]


local output = nil
sql.Query("CREATE TABLE lbenchtest(id INT, ltext TEXT)")
sql.Query("INSERT INTO lbenchtest(id,ltext) VALUES(1,'CrazyText')")

LuctusCompareOften(20,0.2,100,{
    {"",function()
        local a = ranStr()
        file.Write("ltest.txt",a)
        sql.Query("UPDATE lbenchtest SET ltext='"..a.."' WHERE id=1")
    end},
    {"file",function()
        output = file.Read("ltest.txt","DATA")
    end},
    {"sql ",function()
        output = sql.QueryValue("SELECT ltext FROM lbenchtest WHERE id=1")
    end},
})
