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

foreach code read/lines %../bench/data.pool [
    unless "N9J5" = select decode code "Locker code" [
        print "oh snap" break
    ]
]
