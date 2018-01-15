Red [
    Title:   "Grab-bag of mezzanines"
    Author:  9214
    File:    %utils.red
    Tabs:    4
    License: ["WTFPL" - https://github.com/9214/daruma/blob/master/COPYING]
]

&: :and
|: :or
~: :complement

unfold: function [spec][
    rejoin collect [
        repeat index length? bits: charset spec [
            if bits/:index [keep to char! index]
        ]
    ]
]

with: function ['environment body][
    either block? environment [
        foreach ctx reduce environment [bind body ctx]
    ][
        bind body get environment
    ]
]

retreat: func ['index bump body][
    do bind compose/deep [
        set quote (index) bump
        while [(index) > 0][
            (body)
            set quote (index) (index) - 1 
        ] 
    ] context reduce [
        to set-word! index none
    ]
]

enumerate: function [series][
    forall series [series/1: do series/1]
]

fold: function [series funct base][  
    body: copy [funct base value]
    case/all [
        series? base [base: copy/deep base]
        op? :funct   [reverse/part body 2]
    ]
    insert body quote base:
    foreach value series body
]

map: function [series spec body][  
    f: func spec body
    collect [
        foreach :spec series [
            keep do compose [(:f) (:spec)]
        ]
    ]
]

then: make op! func [x f][f x]
