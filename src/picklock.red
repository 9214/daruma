Red [
    Title:   "Akuda closet unlocker (via savegame patching)"
    Author:  9214
    File:    %picklock.red
    Tabs:    4
    License: ["WTFPL" - https://github.com/9214/daruma/blob/master/COPYING]
]

picklock: context with datasheet [
    slot?: func [file [file!]][
        parse file slot
    ]

    scan: has [file slots][
        slots: collect [
            foreach file read what-dir [
                if slot? file [keep file]
            ]
        ]
        either empty? slots [none][slots]
    ]

    zero: func [slot [file!]][
        write/binary/seek slot #{00} offset
    ]

    set 'unlock has [slots][
        all [
            slots: scan
            forall slots [zero first slots]
        ]
    ]
]
