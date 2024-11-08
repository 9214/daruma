Red [
    Title:   "Unlocking Akuda bar closet via savegame file modification"
    Author:  @9214
    Date:    09-Nov-2024
    File:    %picklock.red
    License: "0-clause BSD"
]

unlock: function [
    "Modify game save files"
    file    [file!]        "Directory or a single file"
    return: [block! none!] "Modified save files or none"
][
    all [
        slots: any [
            if dir?  file [scan file]
            if slot? file [to block! file]
        ]
        forall slots [zero first slots]
        new-line/all slots on
    ]
]

<data>

"Save file name format"
slot:  [%slot index %.sav]
index: [#"0" - #"4"]

"Byte offset into save file data"
offset: 00002D58h

<code>

scan: function [
    "Scan directory for save files"
    directory [file!]        "Directory to scan"
    return:   [block! none!] "Located save files or none"
] [
    unless empty? slots: collect [
        foreach file read directory [
            if slot? file [keep directory/:file]
        ]
    ][
        slots
    ]
]

slot?: function [
    "Check if file name matches save file format"
    file    [file!]  "File to check"
    return: [logic!] "Boolean result"
][
    parse file slot
]

zero: func [
    "Modify game save file"
    slot    [file!]  "Save file"
    return: [unset!]
][
    write/binary/seek slot #{00} offset
]

<init>

index: charset index
