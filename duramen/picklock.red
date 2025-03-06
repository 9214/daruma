Red [
    Title:   "Unlocking Akuda bar closet via savegame file modification"
    Author:  @9214
    Date:    09-Nov-2024
    File:    %picklock.red
    License: "0-clause BSD"
]

unlock: function [
    "Modify savegame files"
    file    [file!]        "Name of a directory or a single file"
    return: [block! none!] "Modified savegame files or none"
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

"Savegame file name format"
slot:  [%slot index %.sav]
index: [#"0" - #"4"]

"Byte offset into savegame file data"
offset: 00002D58h

<code>

scan: function [
    "Scan directory for savegame files"
    directory [file!]        "Directory to scan"
    return:   [block! none!] "Located savegame files or none"
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
    "Check if file name matches savegame file name format"
    file    [file!]  "Name of the file to check"
    return: [logic!] "Boolean result"
][
    parse file slot
]

zero: func [
    "Modify the savegame file"
    slot    [file!]  "Name of the savegame file"
    return: [unset!]
][
    write/binary/seek slot #{00} offset
]

<init>

index: charset index
