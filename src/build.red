Red [
    Title:   "Build script"
    Author:  9214
    File:    %build.red
    Tabs:    4
    License: ["WTFPL" - https://github.com/9214/daruma/blob/master/COPYING]
]

files: [
    %utils.red
    %datasheet.red
    %picklock.red
    %converter.red
    %decoder.red
    %interface.red
]

includes: collect [
    #process off
    forall files [keep reduce [#include first files]]
]

header: [
    Title:   "BG&E Internet code decoder"
    Author:  "https://github.com/9214"
    Version: 1.2.1.5
    Icon:    %../misc/mdisk.ico
    Needs:   View
]

body: [
    repo: https://github.com/9214/daruma

    system/view/capturing?: yes
    unless unlock [view/flags window [no-min no-max]]
]

print either files = intersect files read what-dir [
    save/header %main.red append new-line/skip includes on 2 body header
    "done"
][
    "something is missing"
]
