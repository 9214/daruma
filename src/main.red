Red [
    Title:   "highlevel one-line dispatch"
    Author:  https://github.com/9214
    File:    %main.red
    License: "WTFPL"
    Tabs:    4
    Needs:   View
    Icon:    %../msc/mdisk.ico
]

#include %aids.red
#include %decoder.red
#include %picklock.red
#include %gui.red

unless unlock [view/flags window [no-min no-max]]
