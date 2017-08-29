Red [
    Title:   "BG&E Internet code decoder"
    Author:  https://github.com/9214
    File:    %decoder.red
    License: "WTFPL"
    Tabs:    4
]

; == macros ==
#do [
    unfold: func [
        range [block!]
        /local
            spec
            index
            bump
            range*
    ][
        range*: copy range
        to string! collect [
            while [not tail? range*][
                spec: head remove at take/part range* 3 2
                forall spec [poke spec 1 to char! form first spec]
                set [index bump] spec

                until [keep to char! index (index: index + 1) > bump]
            ]
        ]
    ]

    prime?: func [number [integer!] /local bump i][                                    ;@ hard-won version which works the same both compiled and interpreted; ugly, but practical
        either number >= i: 2 [
            while [i <= to integer! square-root number][
                if number // i = 0 [return no]
                i: i + 1
            ]
        ][
            return no
        ]
        return yes
    ]
]

#macro make-base64: func [/local alphanumeric][
    append
        alphanumeric: sort/case unfold [a - z A - Z 0 - 9]
        reduce [take/part alphanumeric 10 "+/"]
]

#macro make-bge-base64: func [/local bge-base64][
    bge-base64: make-base64
    foreach [char sub] "+?/!I+O\l&0/" [poke find/case bge-base64 char 1 sub]
    return bge-base64                                                                  ; in fact it's a mix of Base64 and Base58
]

#macro make-primes: func [bump [integer!] /local i][
    collect [repeat i bump [if prime? i [keep i]]]
]

#macro make-key: func [][
    reduce [reverse head remove at remove/part make-primes 37 3 3]
]

; == core logic ==
decoder: context [
    converter: context [
        encoding: make-bge-base64
        letters:  #do keep [unfold [A - Z]]
        digits:   #do keep [unfold [0 - 9]]
        scheme: [
            playtime             00:10:00 63:14:07                                     ; assuming you're not Sonic the Hedgehog
            pallet-game-trophies 00       02
            animals              01       56
            pearls               01       88
            zero                 00       00                                           ;@ always zero?
            yo!-pearl-record     140'646  2'000'000
            locker-code          ...      ...
            padding-zero         00       00                                           ;@ always zero?
            salt                 ...      ...
        ]

        internet-code?: func [text-data [string!]][
            parse text-data reduce [16 charset encoding]
        ]

        valid?: func [
            metainfo [object!]
            /local
                rule  [block!]
                l     [bitset!]
                d     [bitset!]
                entry [block!]
                field [time! integer!]
                base  [time! integer!]
                top   [time! integer!]
                value [time! integer!]
        ][
            rule:  [(l: charset letters d: charset digits) l d l d]
            entry: [field base top]
            all collect [
                foreach :entry bind scheme metainfo [
                    value: reduce field
                    keep switch/default field [
                        locker-code [parse value rule]
                        salt        [BADC0DEh <> value]
                    ][
                        fits? base value top
                    ]
                ]
            ]
        ]

        debase: func [internet-code [string!] /local char [char!]][
            collect [
                foreach char internet-code [
                    keep (index? find/case encoding char) - 1
                ]
            ]
        ]

        pick-lock: func [dword [binary!] /local b1 [binary!] b2 [binary!]][
            to string! collect [
                foreach [b1 b2] dword [
                    keep reduce [letters/(b1 + 1) b2]
                ]
            ]
        ]

        format: func [dwords [block!] /local fields [block!] key [word!]][
            dwords/1: to time! dwords/1
            remove at head insert at dwords 2 reverse dissect dwords/2 6
            dwords/7: pick-lock to binary! dwords/7

            make object! collect [
                foreach key fields: extract scheme 3 [
                    keep reduce [to set-word! key dwords/(index? find fields key)]
                ]
            ]
        ]
    ]

    cypher: context [
        ~: :complement                                                                 ; sweeten with some syntactic sugar
        &: :and
        |: :or

        key:       make-key
        digest:    copy []
        game-data: copy []
        
        lookup-table: [
            [ 01 007E0000h 17
              02 00010000h 11
              02 00000003h 03
              03 00003F00h 08 ]
            [ 02 07000000h 24
              04 00FC0000h 18
              05 0003F000h 12
              06 00000FC0h 06
              07 0000003Fh 00 ]
            [ 09 1E000000h 25
              10 01000000h 19
              10 00001F00h 08
              11 001F0000h 14
              11 0000000Ch 02
              12 00000003h 04 ]
            [ 08 000000FCh 02
              09 00000003h 04 ]
        ]

        p-box: [
            <1> [
            retreat i 06 [
                swap [ (i % 6)-th bit in (2 * i + (i / 6) + 1)-th block with
                       (i - 1)-th bit in (16)-th block ]
            ]]
            <2> [
            subkey:  key/(_: digest/16 >> 3 & 00000007h + 1)                           ; 3 leftmost bits
            subkey*: key/((length? key) - _ + 1)
            retreat i 30 [
                n: i * subkey  + 45 % 90
                m: i * subkey* + 45 % 90
                swap [ (p: n % 6)-th bit in (n - p / 6 + 1)-th block with
                       (q: m % 6)-th bit in (m - q / 6 + 1)-th block ]
            ]]
            <3> [
            subkey: key/(digest/16 & 00000007h + 1)                                    ; 3 rightmost bits
            retreat i 40 [
                n: i * subkey % 90
                m: n % 6
                flip [ (m)-th bit in (n - m / 6 + 1)-th block ]
            ]]
        ]

        swap: func [
            spec [block!]
            /local
                offset-x   [integer!]
                offset-o   [integer!]
                index-x    [integer!]
                index-o    [integer!]
                bit-x      [integer!]
                bit-o      [integer!]
                position-x [integer!]
                position-o [integer!]
        ][
            set [offset-x index-x offset-o index-o] mute spec

            bit-x: digest/:index-x >> offset-x & 00000001h
            bit-o: digest/:index-o >> offset-o & 00000001h

            position-x: (~ 00000001h << offset-x) & digest/:index-x
            digest/:index-x: position-x | (bit-o << offset-x)
                                                                                       ; 1st one is modified by bit from 2nd
            position-o: (~ 00000001h << offset-o) & digest/:index-o                    ; and only then 2nd is modified by bit from 1st
            digest/:index-o: position-o | (bit-x << offset-o)
        ]

        flip: func [
            spec [block!]
            /local
                offset      [integer!]
                index       [integer!]
                bit         [integer!]
                flipped-bit [integer!]
                position    [integer!]
        ][
            set [offset index] mute spec

            position: (~ 00000001h << offset) & digest/:index
            bit: digest/:index >> offset & 00000001h
            flipped-bit: (~ bit) & 00000001h

            digest/:index: position | (flipped-bit << offset)
        ]

        shuffle: func [/local index [tag!] permutation [block!]][
            foreach [index permutation] p-box [context permutation]
        ]

        transpose: func [
            /local
                entry  [block!]
                index  [integer!]
                mask   [integer!]
                offset [integer!]
                <>     [word!]
                ><     [word!]
        ][
            game-data: collect [
                keep digest/15 * 60 + digest/14 * 60 + digest/16                     ; total playtime, hh:mm:ss
                foreach entry lookup-table [                                         ; in-game collectibles stats and padding zeroes
                    keep fold map entry [index mask offset][
                        set [<> ><] do compose [
                            (if mask = 00000003h [[reverse copy]]) [>> <<]
                        ]
                        redo [digest/(index) & redo [mask <> offset] >< offset]
                    ] :| 0
                ]
            ]
        ]

        check: func [
            /local
                grain    [block!]
                checksum [integer!]
                salt     [integer!]
                mask     [integer!]
                offset   [integer!]
        ][
            grain: [
                FFC00000h 22
                003FF000h 12
                00000FFCh 02
                00000003h 00
            ]
            checksum: fold compose [(skip game-data 1) (skip digest 13)] :+ 0
            salt: fold map grain [mask offset][checksum & mask >> offset] :+ 0

            append game-data pick
                reduce [salt BADC0DEh]                                                 ;@ either magic constant
                digest/12 & (000003C0h >> 6) << 6 | digest/13 = salt                   ;@ or validating raw data BEFORE formatting
        ]

        pass-thru: func [encoded-data [block!]][
            digest: encoded-data 
            shuffle transpose check
        ]
    ]

    decoding-scheme: with [converter cypher][
        case [
            16 <> length? text-data      [return #invalid-length]
            not internet-code? text-data [return #wrong-character]
        ]

        metainfo: text-data
            |> :debase
            |> :pass-thru
            |> :format
        
        either valid? metainfo [metainfo][#invalid-code]
    ]

    set 'decode func [text-data [string!] /local metainfo [object!]] decoding-scheme
]
