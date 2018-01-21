Red [
    Title:   "Input/output converter"
    Author:  9214
    File:    %converter.red
    Tabs:    4
    License: ["WTFPL" - https://github.com/9214/daruma/blob/master/COPYING]
]

converter: context with datasheet [
    format: function [raw [block!] /local size type name flag][
        bytes: rejoin collect [forall raw [keep to binary! raw/1]]
        reverse/part skip bytes 4 4                                         ; N.B. little-endian order
        entry: [
            set size integer! set type word! set name string! [
                skip '- skip | set flag skip
            ]
        ]
        unmarshall: quote (
            value: take/part bytes size
            code?: :flag = 'locker-code
            keep reduce [
                to set-word! replace/all name space "-" 
                either code? [
                    enbase value
                ][
                    make get type to integer! value
                ]
            ]
        )

        object collect compose/deep/only [
            parse scheme [some [entry (unmarshall)]]
        ]
    ]

    enbase: function [code [binary!]][
        rejoin collect [
            foreach [index digit] code [
                keep reduce [letters/(index + 1) digit]
            ]
        ]
    ]

    debase: does [
        forall digest [
            digest/1: subtract index? find/case encoding digest/1 1
        ]
    ]
]