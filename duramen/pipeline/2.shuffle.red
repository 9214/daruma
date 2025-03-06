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

swap: function [
    "Swap two bits within digest"
    digest     [binary!] "Internet code digest"
    coordinate [block!]  "Byte index and bit offset pairs"
    return:    [binary!] "Processed output"
    /local
        index offset
        this that
        value
][
    set [index offset value this that][x y 1 1 2]

    ; finding bytes at specified 0-based indices
    byte: reduce [
        at digest 0 based coordinate/:this/:index
        at digest 0 based coordinate/:that/:index
    ]
    ; extracting bits at specified offsets from the right
    bit: reduce [
        byte/:this/:value >> coordinate/:this/:offset and 1
        byte/:that/:value >> coordinate/:that/:offset and 1
    ]
    ; zeroing out vacant holes in indexed bytes
    place: reduce [
        byte/:this/:value and complement 1 << coordinate/:this/:offset
        byte/:that/:value and complement 1 << coordinate/:that/:offset
    ]
    ; swapping bits around in that specific order
    byte/:this/:value: bit/:that << coordinate/:this/:offset or place/:this
    byte/:that/:value: bit/:this << coordinate/:that/:offset or place/:that

    digest
]

flip: function [
    "Complement single bit within digest"
    digest     [binary!] "Internet code digest"
    coordinate [pair!]   "Byte index and bit offset pair"
    return:    [binary!] "Processed output"
    /local
        index offset
        value
][
    set [index offset value][x y 1]

    ; finding byte at specified 0-based index
    byte: at digest 0 based coordinate/:index
    ; extracting bit at specified offset from the right
    bit: byte/:value >> coordinate/:offset and 1
    ; flipping extracted bit
    flip: 1 and complement bit
    ; zeroing out vacant hole in an indexed byte
    place: byte/:value and complement 1 << coordinate/:offset
    ; filling in zeroed out hole with a flipped bit
    byte/:value: flip << coordinate/:offset or place

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
