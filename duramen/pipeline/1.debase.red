pass: function [
    "Convert Internet code to digest"
    code    [string!] "Internet code"
    return: [binary!] "Digest"
][
    to binary! collect [
        foreach symbol code [
            keep subtract
                index? find/case encoding symbol
                1
        ]
    ]
]

<data>

"0-based Internet code alphabet"
encoding: {
    A B C D E F G H
    + J K L M N \ P
    Q R S T U V W X
    Y Z a b c d e f
    g h i j k & m n
    o p q r s t u v
    w x y z / 1 2 3
    4 5 6 7 8 9 ? !
}

<init>

encoding: trim/all encoding
