Red [
    Title:   "Decoding algorithm implementation"
    Author:  9214
    File:    %decoder.red
    Tabs:    4
    License: ["WTFPL" - https://github.com/9214/daruma/blob/master/COPYING]
]

decoder: context with [datasheet converter][
    swap: function [spec [block!]][
        spec: reduce spec
        offset: extract spec 2
        index: extract/index spec 2 2

        bit: reduce [
            digest/(index/1) >> offset/1 & 01h
            digest/(index/2) >> offset/2 & 01h
        ]

        position: (~ 01h << offset/1) & digest/(index/1)
        digest/(index/1): position | (bit/2 << offset/1)
                                                                            ; N.B. order is important
        position: (~ 01h << offset/2) & digest/(index/2)
        digest/(index/2): position | (bit/1 << offset/2)
    ]

    flip: function [spec [block!] /local offset index][
        set [offset index] reduce spec

        position: (~ 01h << offset) & digest/:index
        bit: digest/:index >> offset & 01h
        flipped-bit: (~ bit) & 01h

        digest/:index: position | (flipped-bit << offset)
    ]

    shuffle: has [index permutation][
        foreach [index permutation] permutation-box [
            context bind/copy compose [
                (permutation)
                attempt [enumerate subkey]
                retreat i count compose/deep/only [
                    attempt [enumerate factor: copy (factor)]
                    (op) (spec)
                ]
            ] self
        ]
    ]

    transpose: has [entry index mask offset][
        collect [
            keep do second lookup/table
            foreach entry parse skip lookup/table 2 [
                collect some [refinement! keep some integer!]
            ][
                keep fold map entry [index mask offset] compose/only [
                    do bind (lookup/query) context [
                        shift-forward: shift-back: none
                        set [shift-forward shift-back] reduce do compose [
                            (pick [[reverse copy]] mask = lookup/exception)[:>> :<<]
                        ]
                    ]
                ] :| 0
            ]
        ]
    ]

    verify: function [raw [block!]][
        time: to time! first raw
        numbers: reduce append copy next raw [
            to integer! time/second
            time/minute
            time/hour
        ]

        valid?: context [
            sum: fold numbers :+ 0
            return equal? 
                do checksum/condition 
                fold map checksum/table [mask offset] bind checksum/query self :+ 0
        ]
        
        all [valid? raw]
    ]

    check: function [game-data [object!]][
        values: extract/index body-of game-data 2 2
        bounds: parse scheme [
            collect some [3 skip keep [skip '- skip | skip]]
        ]

        correct?: all collect [
            forall bounds [
                bound: bounds/1
                value: values/(index? bounds)
                keep switch type?/word bound [
                    block!   [all [value >= first bound value <= last bound]]
                    integer! [value = bound]
                    word!    [parse value get bound]
                ]
            ]
        ]

        all [correct? game-data]
    ]

    internet-code?: func [input [string!]][
        parse input internet-code
    ]

    init: func [input [string!]][
        extract/into input 1 clear digest
    ]

    set 'decode func [input [string!]][
        if internet-code? input [
            attempt [
                init input
                debase shuffle transpose 
                then :verify then :format then :check
            ]
        ]
    ]
]
