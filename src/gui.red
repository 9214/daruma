Red [
    Title:   "daruma graphical user interface"
    Author:  https://github.com/9214
    File:    %gui.red
    License: "WTFPL"
    Tabs:    4
]

system/view/capturing?: yes

; == main UI ==
window: layout with [decoder/converter][
    title    "daruma"
    backdrop 82.103.98

    f: field 200x20 center font-name "Consolas" hint "press Enter for help"
        on-enter [
            case [
                empty? f/text [browse https://github.com/9214/daruma]
                internet-code? f/text [
                    either object? metainfo: decode f/text [
                        f/text: metainfo/locker-code
                    ][
                        blink 239.204.203 on
                    ]
                ]
            ]
        ]
        on-time [
            blink white off
        ]
        on-detect [
            attempt [
                keycode: to integer! event/key
                all [
                    16 <= length? f/text
                    08 <> keycode                                                      ; backspace
                    13 <> keycode                                                      ; enter
                    'stop
                ]
            ]
        ]

        do [
            blink: func [color [tuple!] mode [logic!]][
                f/color: color
                f/rate:  either mode [0:0:0.2][none]
            ]
        ]
]
