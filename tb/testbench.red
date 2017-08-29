Red [
    Title:   "Ad hoc tests"
    Author:  https://github.com/9214
    File:    %testbench.red
    Tabs:    4
]

#include %../src/aids.red
#include %../src/decoder.red

run-decoder-test: has [expected total pool result][
    expected: "N9J5"
    total: length? pool: read/lines %./data.pool

    foreach internet-code pool [
        result: decode internet-code
        unless attempt [expected = result/locker-code][
                print [
                    "input:"    tab internet-code      lf
                    "result:"   tab result             lf
                    "expected:" tab expected           lf
                    index? find/case pool internet-code 
                    slash 
                    total tab "✗"
                ]
                quit
        ]
    ]
    print ["decoded" tab total slash total tab "✓"]
]

run-decoder-test
