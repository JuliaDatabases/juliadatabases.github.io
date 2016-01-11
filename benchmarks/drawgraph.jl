using Gadfly
using DataFrames

bench_plot(x, y, kind, sz) =
    draw(PNG("$kind.png", sz...), plot(x=x, y=y, Geom.bar, Theme(bar_spacing=3mm), Guide.xlabel("Database Drivers"), Guide.ylabel("Time in seconds"), Guide.title(uppercase(kind)), color=x))

benchmarks = readtable("benchmarks.csv")
x = benchmarks[:DataBase_Drivers]
bench_plot(x, benchmarks[:Insert_time], "insert", (8inch, 6inch))
bench_plot(x, benchmarks[:Update_time], "update", (8inch, 6inch))
bench_plot(x, benchmarks[:Retrieval_time], "select", (8inch, 6inch))
