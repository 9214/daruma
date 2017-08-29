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
    hash: {f3dce4c87744dd5868e9a9ef4c0985d4defeec0f}
    do to url! trim/all/lines form compose [
        https://gist.githubusercontent.com/9214/7f6ec82a65c2b1ff1d9b40f9d585a241/raw/ 
        (hash)/ 
        encap.red
    ]

    encap
        source-of/header system/options/script
        reduce [%./src/ scripts]
        load %.config
]

debug: does [
    change-dir %./src/
    forall scripts [do first scripts]
]
