pass: function [
    "Unmarshal game data into human-readable format"
    words   [vector!] "Machine words"
    return: [map!]    "Restored values"
][
    raw: rejoin collect [
        forall words [
            keep copy/part to binary! words/1 4 ; 32 bits each, little-endian order
        ]
    ]
    result: make map! collect [
        foreach [size type name] scheme [
            value: take/part raw size
            keep name
            keep switch type [
                integer! [to integer! value]
                time!    [to time! to integer! value]
                string!  [enbase value]
            ]
        ]
    ]

    result
]

<data>

"Range of letters used in locker code"
letters: [#"A" - #"Z"]

"Layout of values in restored game data"
scheme: [
    4    time!     "Total playtime"
    1 integer!       "Trophies won"
    1 integer! "Animals catalogued"
    1 integer!   "Pearls collected"
    1 integer!               "Zero"
    4 integer!   "YO! Pearl record"
    4  string!        "Locker code"
    4 integer!     "Padding zeroes"
]

<code>

unfold: function [
    "Convert character set into string"
    spec    [block!]  "Bitset spec"
    return: [string!] "Resulting string"
][
    rejoin collect [
        repeat index length? bits: charset spec [
            if bits/:index [keep to char! index]
        ]
    ]
]

enbase: function [
    "Decode binary representation of locker code"
    code    [binary!] "4-byte locker code"
    return: [string!] "Plaintext format"
][
    rejoin collect [
        foreach [index digit] code [
            keep reduce [letters/(0 based index) digit]
        ]
    ]
]

<init>

letters: unfold letters
