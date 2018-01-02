Red [
    Title:   "Grab-bag of handy functions"
    Author:  https://github.com/9214
    File:    %aids.red
    License: "WTFPL"
    Tabs:    4
]

|>: make op! func [
    "pipe operator" 
    x [any-type!]
    f [function!]
][
    f x
]

fold: func [
    "corerce series with specified binary function"
    series [series!]
    funct  [any-function!]
    base   [any-type!]                                                                 ; [scalar!] would be a purist's choice
    /local
        body  [block!]
        value [any-type!]
][  
    body: copy [funct base value]
    case/all [
        series? base [base: copy/deep base]
        op? :funct   [reverse/part body 2]
    ]
    insert body quote base:
    foreach value series body
]

map: func [
    "apply function to elements of the series"
    series [series!]
    spec   [block!]
    body   [block!]
][
    collect [
        foreach :spec series [
            keep do reduce compose [func spec body (:spec)]
        ]
    ]
]

redo: func [
    "<do reduce [...]> shortcut" 
    src [block!]
][
    do reduce src
]

mute: func [
    "remove all words from block" 
    spec [block!]
][
    reduce trim replace/all spec word! none
]

fits?: func [
    "does x lies between two opposites?" 
    low  [scalar!] 
    x    [scalar!]
    high [scalar!]
][
    all [x >= low x <= high]
]

dissect: func [
    "reconstruct value to a block of bytes"
    value [any-type!] 
    /local byte [binary!]
][
    collect [foreach byte to binary! value [keep reduce [byte]]]
]

with: func [
    "bind block to multiple contexts at once"
    contexts [block!] 
    body     [block!]
][  
    forall contexts [bind body reduce first contexts]
]

retreat: func [
    "like repeat, only backwards"
    'index [word!] 
    bump   [integer!] 
    body   [block!]
][
    do bind compose/deep [
        set quote (index) bump
        while [(index) > 0][
            (body)
            set quote (index) (index) - 1 
        ] 
    ] context reduce [to set-word! index none]
]

unfold: func [spec /local bits index][
    rejoin collect [
        repeat index length? bits: charset spec [
            if bits/:index [keep to char! index]
        ]
    ]
]
