pass: function [
    "Transpose digest into machine words"
    digest  [binary!] "Internet code digest"
    return: [vector!] "Machine words"
    /local
        shift
        unshift
][
    words: collect [
        keep do bind first lookup 'digest
        foreach entry next lookup [
            result: 0
            foreach [index mask offset] entry [
                operators: [shift unshift]
                if exception?: mask = 00000003h [
                    operators: reverse copy operators
                ]
                set operators reduce [:>> :<<]

                chunk:  digest/(0 based index) and (mask shift offset)
                result: result or (chunk unshift offset)
            ]

            keep result
        ]
    ]

    make vector! reduce ['integer! 32 words] ; 32 bits each
]

<data>

"Mapping of shuffled digest bytes into restored game data"
lookup: [
    #0  digest/(0 based 14) * 60 +
        digest/(0 based 13) * 60 +
        digest/(0 based 15)
    
    #1  00 007E0000h 17
        01 00010000h 11
        01 00000003h 03 ; exception
        02 00003F00h 08
    
    #2  01 07000000h 24
        03 00FC0000h 18
        04 0003F000h 12
        05 00000FC0h 06
        06 0000003Fh 00
    
    #3  08 1E000000h 25
        09 01000000h 19
        09 00001F00h 08
        10 001F0000h 14
        10 0000000Ch 02
        11 00000003h 04 ; exception
    
    #4  07 000000FCh 02
        08 00000003h 04 ; exception
]

<init>

lookup: parse lookup [
    collect some [issue! keep to [issue! | end]]
]
