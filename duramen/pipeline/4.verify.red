pass: function [
    "Verify data against embedded checksum"
    digest  [binary!] "Processed Internet code digest"
    words   [vector!] "Restored machine words"
    return: [pair!]   "Actual/expected checksum"
][
    time:  to time! words/(0 based 0)
    total: sum reduce append
        copy [time/hour time/minute to integer! time/second]
        to block! next words
    
    ; 6 leftmost bits of 12th byte ORed with 4 rightmost bits of 11th byte
    expected: digest/(0 based 11) and 0000000Fh << 6 or digest/(0 based 12)
    
    actual: 0
    foreach [mask offset] checksum [
        actual: add actual total and mask >> offset
    ]

    as-pair actual expected
]

<data>

"Lookup table that accumulates game data into checksum"
checksum: [
    FFC00000h 22
    003FF000h 12
    00000FFCh 02
    00000003h 00
]
