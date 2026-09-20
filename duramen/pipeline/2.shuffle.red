pass: function [
    "Perform rounds of bit shuffling"
    digest  [binary!] "Internet code digest"
    return: [block!]  "Processing trace"
][
    trace: collect [
        foreach shuffle rounds [
            keep digest: shuffle copy digest
        ]
    ]

    new-line/all trace on
]

<data>

"Symmetric key used for subkey derivation in permutation rounds"
key: #{25 1f 1d 17 13 11 0b 07}

"Permutation rounds"
rounds: [
    :swap 06
        index:  none
        subkey: none
        factor: none
        spec: [
            [2 * :I + (:I / 6)] [:I % 6]
            [15               ] [:I - 1]
        ]
    
    :swap 30
        index:  digest/(0 based 15) >> 3 and 07h ; 3 leftmost bits
        subkey: [
            key/(0 based index)
            key/(0 based subtract length? key 0 based index)
        ]
        factor: [
            [:I * subkey/(0 based 0) + 45 % 90]
            [:I * subkey/(0 based 1) + 45 % 90]
            [     factor/(0 based 0)      %  6]
            [     factor/(0 based 1)      %  6]
        ]
        spec: [
            [factor/(0 based 0) - factor/(0 based 2) / 6] [factor/(0 based 2)]
            [factor/(0 based 1) - factor/(0 based 3) / 6] [factor/(0 based 3)]
        ]
    
    :flip 40
        index:  digest/(0 based 15) and 07h ; 3 rightmost bits
        subkey: key/(0 based index)
        factor: [
            [:I * subkey         % 90]
            [factor/(0 based 0)  %  6]
        ]
        spec: [
            [factor/(0 based 0) - factor/(0 based 1) / 6] [factor/(0 based 1)]
        ]
]

<code>

pluck: function [
    "Read out the bit sitting at an offset from the right"
    byte    [binary!]  "Digest at the byte in question"
    offset  [integer!] "Bit offset from the right"
    return: [integer!] "Bit that sits there"
][
    byte/(0 based 0) >> offset and 1
]

plant: function [
    "Seat a bit at an offset from the right"
    byte    [binary!]  "Digest at the byte in question"
    offset  [integer!] "Bit offset from the right"
    bit     [integer!] "Bit to seat there"
    return: [binary!]  "Processed output"
][
    also byte byte/(0 based 0): or~
        byte/(0 based 0) and complement 1 << offset
        bit << offset
]

swap: function [
    "Swap two bits within digest"
    digest     [binary!] "Internet code digest"
    coordinate [block!]  "Byte index and bit offset pairs"
    return:    [binary!] "Processed output"
    /local
        index offset
        this that
][
    set [index offset this that][x y 1 2]

    ; finding bytes at specified 0-based indices
    byte: reduce [
        at digest 0 based coordinate/:this/:index
        at digest 0 based coordinate/:that/:index
    ]
    ; reading out both bits before either of them is disturbed
    bit: reduce [
        pluck byte/:this coordinate/:this/:offset
        pluck byte/:that coordinate/:that/:offset
    ]
    ; seating each bit where the other one sat, re-reading byte as it is written
    plant byte/:this coordinate/:this/:offset bit/:that
    plant byte/:that coordinate/:that/:offset bit/:this

    digest
]

flip: function [
    "Complement single bit within digest"
    digest     [binary!] "Internet code digest"
    coordinate [pair!]   "Byte index and bit offset pair"
    return:    [binary!] "Processed output"
    /local
        index offset
][
    set [index offset][x y]

    ; finding byte at specified 0-based index
    byte: at digest 0 based coordinate/:index
    ; seating the complement of whatever sits there
    bit: pluck byte coordinate/:offset
    plant byte coordinate/:offset 1 and complement bit

    digest
]

expand: function [
    "Expand descriptions of permutation rounds into functions"
    rounds  [block!] "Descriptions"
    return: [block!] "Processed output"
    /local
        match
        rest
][
    mark: [get-word! integer!]
    rule: [
        collect some [
            copy match mark
            copy rest to [mark | end]
            keep (compose data)
        ]
    ]
    data: [
        modify: (match/1)
        count:  (match/2)
        (rest)
    ]

    spec: [digest [binary!] return: [binary!]]
    body: [
        (preamble)
        ; counting backwards down to 1 inclusively
        repeat i count [
            i: count + 1 - i
            attempt [unroll factor: copy (reduce [preamble/factor])]
            coords: reduce collect [foreach [index offset] spec [keep as-pair do index do offset]]
            values: do skip [first coords] make integer! :modify = :swap
            digest: modify digest values
        ]
    ]
    fill: [
        head insert
            find/tail compose/deep body 'subkey
            'reduce
    ]

    collect [
        foreach preamble parse rounds rule [
            keep function spec do fill
        ]
    ]
]

<init>

rounds: expand rounds
