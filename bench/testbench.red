Red [
    Title:   "Ad-hoc tests"
    Author:  9214
    File:    %testbench.red
    Tabs:    4
    License: ["WTFPL" - https://github.com/9214/daruma/blob/master/COPYING]
]

#include %../src/utils.red
#include %../src/datasheet.red
#include %../src/converter.red
#include %../src/decoder.red

pool: read/lines %../bench/data.pool
count: 0
foreach code pool [
    unless all [
        result: decode code
        result/locker-code = "N9J5"
    ][
        print "oh snap" break
    ]
]
