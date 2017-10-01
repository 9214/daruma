Red [
    Title:   "BG&E MDisk #13"
    Rights:  "Hey Pops, stay Zen!"
    Icon:    %./msc/mdisk.ico
    Version: 1.2.1.5
    Needs:   View

    Author:  https://github.com/9214
    Date:    21-07-2017
    License: "WTFPL"
    Tabs:    4
]

scripts: [%aids.red %decoder.red %picklock.red %gui.red %main.red]

release: does [
    hash: {2c095a6748a46599ff41afa377abcf9c277015fb}
    do to url! trim/all/lines form compose [
        https://gist.githubusercontent.com/9214/7f6ec82a65c2b1ff1d9b40f9d585a241/raw/ 
        (hash)/ 
        encap.red
    ]

    encap
        source-of/header %./make.red                                                   ; system/options/script won't work from console
        reduce [%./src/ scripts]
        load %.config
]

debug: does [
    change-dir %./src/
    forall scripts [do first scripts]
]

'OK