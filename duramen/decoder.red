Red [
    Title:   "Decoding Internet code into game data"
    Author:  @9214
    Date:    09-Nov-2024
    File:    %decoder.red
    License: "0-clause BSD"
]

decode: function [
    "Attempt to decode input into game data"
    input   [string!]    "Interned code"
    return: [map! none!] "Game data or none if input is not an Internet code"
][
    attempt [
        make map! body-of object bind steps 'input
    ]
]

<data>

"Dataflow of input thru the decoding pipeline"
steps: [
      initialized: copy                        input
    1     debased: debase               :initialized
    2    shuffled: shuffle                  :debased
    3  transposed: transpose last          :shuffled
    4    verified: verify last :shuffled :transposed
    5     reified: reify                 :transposed
]

<code>

plumbing: function ["Load pipeline transformation passes into a single namespace"][
    folder: %duramen/pipeline/
    step:   [thru dot keep to dot ".red"]
    collect [
        foreach file sort read folder [
            keep reduce [
                to set-word! form parse file [collect step]
                'context
                append 
                    load rejoin [folder file]
                    [return :pass]
            ]
        ]
    ]
]

<init>

context [
    mezzanine: load %duramen/mezzanine.red
    pipeline:  bind plumbing context mezzanine
    bind steps context pipeline
]
