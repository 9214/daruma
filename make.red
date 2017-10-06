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

compile: does [
    do https://raw.githubusercontent.com/9214/rtool/master/encap.red
    encap
        source-of/header %./make.red                                                   ; system/options/script won't work from console
        reduce [%./src/ scripts]
        load %.config
]

interpret: does [
    change-dir %./src/
    forall scripts [do first scripts]
]

'OK