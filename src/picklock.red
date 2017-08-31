Red [
    Title:   "BG&E Mdisk #13 closet picklock"
    Author:  https://github.com/9214
    File:    %picklock.red
    License: "WTFPL"
    Tabs:    4
]

picklock: context [
    slot?: func [file [file!] /local digit [bitset!]][
        parse file [
            (digit: charset [#"0" - #"4"])
            "slot" digit dot "sav"
        ]
    ]

    scan: func [/local file [file!] slots [block!]][
        slots: collect [
            foreach file read %./ [
                if slot? file [keep file]
            ]
        ]
        either empty? slots [none][slots]
    ]

    zero: func [slot [file!]][
        write/binary/seek slot #{00} 00002D58h
    ]

    set 'unlock func [/local slots [block! none!]][
        all [
            slots: scan
            forall slots [zero first slots on]
        ]
    ]
]
