Red [
    Title:   "Interfacing with the end user"
    Author:  @9214
    Date:    09-Nov-2024
    File:    %use.red
    License: "0-clause BSD"
]

context [
    samples:          load %duramen/samples.red
    picklock: context load %duramen/picklock.red
    decoder:  context load %duramen/decoder.red

    issues?: function ["Check if decoding pipeline is functional"][
        any collect [
            foreach [name sample] reduce samples [
                input:  sample/initialized
                result: decoder/decode input
                unless result = to map! body-of object sample [
                    keep/only new-line/all
                        reduce [
                            quote want: sample
                            quote have: to block! result
                        ]
                        on
                ]
            ]
        ]
    ]

    snapshot: function [
        "Persist the program as a Redbin image"
        name [string!] "Image filename"
    ][
        file: to file! reduce [name %.redbin]
        save/as file interface 'redbin
    ]

    interface: [
        /internal
            'issues? :issues?
            'save    :snapshot
        /external
            'unlock  :picklock/unlock
            'decode  :decoder/decode
    ]

    interface: find/tail
        new-line/all reduce interface on
        /external

    return any [
        issues?
        also interface any [
            empty?   system/script/args
            snapshot system/script/args
        ]
    ]
]
