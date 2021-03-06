# gmod-lua-performance
A simple comparison of performance optimizations for gLUA

These are a few benchmarks that are tested on a Garry's Mod Server idling with DarkRP with only 1 player online.
Some of those benchmarks, if possible, were also tested in a LUA5.3 console on Debian 10. If not otherwise stated differently all tests have been done on a gmod server on linux.  

**The goal of this collection of benchmarks is to show the actual performance gain by implementing "Coding Tips" from the web.**

**These are not made up comparisons, everyone can test the code for themselves and see the difference.**

The sources for some of the "Coding Tips" are:

[lua-users.org](http://lua-users.org/wiki/OptimisationCodingTips)
[lua.org](https://www.lua.org/gems/sample.pdf)
[stackoverflow.com](https://stackoverflow.com/questions/154672/what-can-i-do-to-increase-the-performance-of-a-lua-program/12865406#12865406)



# pairs vs ipairs vs for i=1

TL;DR: Doing a for i=1, #table do loop is way faster than a  for k,v in pairs(table) do loop. ipairs is around as fast as for i=1.

The result (each method loops 10000 times):

    for i=1:  0.00000019999993128295 (1.9999993128295e-07)
    ipairs:   0.00000069999998686399 (6.9999998686399e-07)
    pairs:    0.011984699999971

Code: [files/pairs_vs_ipairs_vs_for.lua](files/pairs_vs_ipairs_vs_for.lua)



# Distance vs DistToSqr

TL;DR: The time difference between Distance and DistToSqr is barely noticable.

The result (average of 10000 calculations):

    Distance:   0.00000026040000557259 (2.6040000557259e-07)
    DistToSqr:  0.00000025130000176432 (2.5130000176432e-07)

The Code: [files/distance_vs_disttosqr.lua](files/distance_vs_disttosqr.lua)



# table.insert vs table[#table+1] = 

TL;DR: The time difference between using table.insert(myTable,9) and myTable[#myTable+1] = 9 is barely noticable, as the results were mostly the same. (Even if tested on Lua5.3 console)

The result (inserting 1million values):

    table.insert:         0.066328400000003
    local table.insert:   0.07047399999999
    [#res+1]:             0.066876700000023

The Code: [files/table.insert_vs_table.lua](files/table.insert_vs_table.lua)



# table.HasValue(table,x) vs table[x]

TL;DR: Directly checking the table key with table[value] is faster.

The result (1million lookups):

    table.HasValue:   0.032319600000051
    table[value]:     0.00024150000001555


The Code: [files/table.hasvalue_vs_table.lua](files/table.hasvalue_vs_table.lua)



# String Concat vs Table Concat

TL;DR: It is faster to add strings together via tables instead of stringing them together directly.

The result (10000 strings):

    GMOD SERVERSIDE CONSOLE
    String Concat:  0.32185959999993
    Table Concat:   0.0099451999999474
    LUA5.3 CONSOLE
    String Concat:  0.086629
    Table Concat:   0.006428

The Code: [files/string_vs_table_concat.lua](files/string_vs_table_concat.lua)



# Multiplication vs Division

TL;DR: In Garry's Mod it is not faster to calculate x * 0.5 than x / 2.
BUT: It is faster to multiply instead of divide in LUA5.3.

The result (average of 100 rounds with 1000000 calculations each):

    GMOD SERVERSIDE CONSOLE
    Multiplication:   0.00081622600000003
    Division:         0.00081775100000215
    LUA5.3 CONSOLE
    Multiplication:   0.01865942
    Division:         0.02342666

The Code: [files/multiplication_vs_division.lua](files/multiplication_vs_division.lua)



# Local vs Global variable speed

TL;DR: It is a little itsy-bitsy bit faster to make all variables local in Garry's Mod. (14% in this example)

The result (average of 100 rounds with 10000 calculations each):

    GMOD SERVERSIDE CONSOLE
    global math.sin:      0.0000059390000023996 (5.9390000023996e-06)
    local math.sin:       0.0000056840000024749 (5.6840000024749e-06)
    LUA5.3 CONSOLE
    global math.sin:      0.00057612
    local math.sin:       0.00049858

The Code: [files/local_vs_global.lua](files/local_vs_global.lua)



# x^2 vs x*x

TL;DR: Both are nearly the same in Garry's Mod. x*x is way faster in LUA5.3.

The result (average of 100 rounds with 10000 calculations each):

    GMOD SERVERSIDE CONSOLE
    x^x:    0.000076017000008051 (7.6017000008051e-05)
    x*x:    0.000071278999989772 (7.1278999989772e-05)
    LUA5.3 CONSOLE
    x^x:    0.00883908
    x*x:    0.0029428

The Code: [files/x_squared_vs_x_times.lua](files/x_squared_vs_x_times.lua)



# while vs for

TL;DR: A for loop is way faster than while.

The result (100x 10000):

    GMOD SERVERSIDE CONSOLE
    while:    0.00000957507999874 (9.57507999874e-06)
    for:      0.0000024306500009516 (2.4306500009516e-06)
    LUA5.3 CONSOLE
    while:    0.00015975869999999
    for:      0.000092178400000006 (9.2178400000006e-05)

The Code: [files/while_vs_for.lua](files/while_vs_for.lua)



# local Color() vs Color()

TL;DR: Defining the color once is faster than using Color() in a loop.

The result (1000x in SysTime() time taken):

    Local:     0.0000070583999997496 (7.0583999997496e-06)
    Non-Local: 0.0000091475999998067 (9.1475999998067e-06)

The Code: [files/local_color_vs_redefining.lua](files/local_color_vs_redefining.lua)


# MySQL vs SQLite

For the full documentation please look at [https://shira.at/gmod/mysql_sqlite.html](https://shira.at/gmod/mysql_sqlite.html).  
Setup: MariaDB on Debian 10 installed on the same server as the Garry's Mod Server. Tested with DarkRP's MySQL functions and the mysqloo module.  

The time is measured from first requesting the data until we can use the data.  

Summary: MySQL is slower in comparison to SQLite. It needs an external connection and needs to wait for request/response delays either via network or via internal linux sockets. It's great for synchronisation of multiple servers, but it's not a "must-have" for servers.

## Query Delay Comparison

To get the delay for a query without read or write operation we can query `SELECT 1+1`.

Result:

    --First Test
    SQLite   ResponseTime:   0.000045883003622293s
    DRPMySQL ResponseTime:   0.020215623022523s
    --Second Test
    SQLite   ResponseTime:   0.000027909001801163s
    DRPMySQL ResponseTime:   0.049109992978629s

## Read and Write Comparison

Query: `SELECT rpname FROM darkrp_player WHERE uid = 76561198071737444`

Result:

    SQLite   Read Time:   0.00016302999938489s
    DRPMySQL Read Time:   0.048014674001024s

Query: `INSERT INTO darkrp_player VALUES(123123,'Test User',1,2)`

Result:

    SQLite   Write Time:   0.00020395400133566s
    DRPMySQL Write Time:   0.06270497100013s

## 1000 inserts (Bulk Inserts)

DarkRP's SQLite method uses sql.Begin and sql.Commit for SQLite based bulk imports. This makes it way faster than doing 1000 inserts after each other.  

DarkRP's MySQL method simply puts the queries into a table and sents them one after the other to the mysql-server. This is way slower, as the time neede is simply the time one insert takes times 1000.

Result:

    SQlite   1000 Inserts:     0.004849937000472s
    DRPMySQL 1000 Inserts:   ~30.000000000000000s (calculated)

