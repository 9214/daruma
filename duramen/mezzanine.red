Red [
    Title:   "Defining helper functions"
    Author:  @9214
    Date:    09-Nov-2024
    File:    %mezzanine.red
    License: "0-clause BSD"
]

based: make op! function [
    base  [integer!]
    value [integer!]
][
    1 - base + value
]

unroll: function [
    value [block!]
][
    forall value [value/1: do value/1]
]
