Red [
    Title:   "Specification for decoding algorithm"
    Author:  9214
    Date:    [
        20-Jun-2017 "project started"
        25-Jul-2017 "first version finished"
        15-Jan-2018 "major rewrite finished"
    ]
    File:    %datasheet.red
    Tabs:    4
    License: ["WTFPL" - https://github.com/9214/daruma/blob/master/COPYING]
    Info:    [
        About: {
            An experiment with data-driven programming and metaprogramming,
            aimed to serve as a reference for other implementations.
            
            For more details about decoding algorithm and examples,
            consult the developement post (see link below),
            or original disassembly dump (see file path).
        }
        Link: https://9214.github.io/13
        Path: %/misc/disasm.s
        N.B.: [
            - "1-based indexing"
            - "no operator precedence"
        ]
    ]
]

datasheet: context [
    <CONVERTING>
    size:     16
    letters:  unfold [#"A" - #"Z"]
    digits:   unfold [#"0" - #"9"]
    encoding: trim/all {
        A B C D E F G H
        + J K L M N \ P
        Q R S T U V W X
        Y Z a b c d e f
        g h i j k & m n
        o p q r s t u v
        w x y z / 1 2 3
        4 5 6 7 8 9 ? !
    }

    letter: charset letters
    digit:  charset digits
    char:   charset encoding
    index:  charset [#"0" - #"4"]

    internet-code: [size char]
    locker-code:   [2 [letter digit]]
    slot:          ["slot" index dot "sav"]

    scheme: [
        4 time!    "Playtime"         00:10:00 - 63:14:07
        1 integer! "Trophies"         00       - 02
        1 integer! "Animals"          01       - 56
        1 integer! "Pearls"           01       - 88
        1 integer! "Zero"                      0
        4 integer! "YO! Pearl record" 140'646  - 2'000'000
        4 string!  "Locker code"          locker-code
        4 integer! "Padding zeroes"            0
    ]

    <DECODING>
    key:    #{25 1F 1D 17 13 11 0B 07}
    offset: 2D58h
    digest: make block! size

    lookup: [
        table [
            /1  (digest/15 * 60 + digest/14 * 60 + digest/16)
            /2  01 007E0000h 17
                02 00010000h 11
                02 00000003h 03 ; *
                03 00003F00h 08
            /3  02 07000000h 24
                04 00FC0000h 18
                05 0003F000h 12
                06 00000FC0h 06
                07 0000003Fh 00
            /4  09 1E000000h 25
                10 01000000h 19
                10 00001F00h 08
                11 001F0000h 14
                11 0000000Ch 02
                12 00000003h 04 ; *
            /5  08 000000FCh 02
                09 00000003h 04 ; *
        ]
        query [
            digest/:index & (mask shift-forward offset) shift-back offset
        ]
        exception 00000003h
    ]

    checksum: [
        table [
            FFC00000h 22
            003FF000h 12
            00000FFCh 02
            00000003h 00
        ]
        numbers [
            /1/second
            /1/minute
            /1/hour
            /2 /3 /4 /5
        ]
        query [
            sum & mask >> offset
        ]
        condition [
            digest/12 & (000003C0h >> 6) << 6 | digest/13
        ]
    ]

    permutation-box: [
        /1 [
            count:  06
            op:     'swap
            index:  none
            subkey: none
            factor: none
            spec: [
                (i % 6)(2 * i + (i / 6) + 1)
                (i - 1)(16)
            ]
        ]

        /2 [
            count:  30
            op:     'swap
            index:  digest/16 >> 3 & 07h + 1                                ; N.B. 3 leftmost bits
            subkey: [
                (pick key index)
                (pick key add 1 subtract length? key index)
            ]
            factor: [
                (i * subkey/1 + 45 % 90)
                (i * subkey/2 + 45 % 90)
                (factor/1 % 6)
                (factor/2 % 6)
            ]
            spec: [
                (factor/3)(factor/1 - factor/3 / 6 + 1)
                (factor/4)(factor/2 - factor/4 / 6 + 1)
            ]
        ]
        
        /3 [
            count:  40
            op:     'flip
            index:  digest/16 & 07h + 1                                     ; N.B. 3 rightmost bits
            subkey: pick key index
            factor: [
                (i * subkey % 90)
                (factor/1 % 6)
            ]
            spec: [
                (factor/2)(factor/1 - factor/2 / 6 + 1)
            ]
        ]
    ]
]
