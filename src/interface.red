Red [
    Title:   "Tiny GUI interface"
    Author:  9214
    File:    %interface.red
    Tabs:    4
    License: ["WTFPL" - https://github.com/9214/daruma/blob/master/COPYING]
]
 
window: layout with decoder [
    title    "daruma"
    backdrop 82.103.98

    entry-box: field 140x20 center middle 
        font [name: "Consolas" size: 9] 
        hint "hit Enter for help"
        on-enter [
            input: entry-box/text
            case [
                empty? input [browse repo]
                internet-code? input [
                    either game-data: decode input [
                        entry-box/text: select game-data "Locker code"
                    ][
                        blink 239.204.203
                    ]
                ]
            ]
        ]
        on-time [
            blink white
        ]
        on-detect [
            attempt [
                keycode: to integer! event/key
                all [
                    16 <= length? entry-box/text
                    08 <> keycode                                           ; backspace
                    13 <> keycode                                           ; enter
                    'stop
                ]
            ]
        ]

    do [
        blink: function [color [tuple!]][
            mode: off
            entry-box/color: color
            entry-box/rate:  pick [0:0:0.3] mode: complement mode 
        ]
    ]
]
