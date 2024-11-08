"An example from BG&E Myth fansite, with YO! pearl record tampered with beforehand" [
    initialized: "+q8FcP711k35&\Ey"
    debased: #{082A3C051C0F3B3535243739250E0432}
    shuffled: [
        #{082A3C051C0F333525243739250F041E} 
        #{280A1615080F33252F2007352D1E151E} 
        #{00200200220526000532121C070A001E}
    ]
    transposed: make vector! [630 66048 139622 184816137 0]
    verified: 519x775
    reified: #[
        "Total playtime" 0:10:30
        "Trophies won" 0
        "Animals catalogued" 1
        "Pearls collected" 2
        "Zero" 0
        "YO! Pearl record" 139622
        "Locker code" "L4S9"
        "Padding zeroes" 0
    ]
]

"What the encoded data in BG&E Myth code actually encodes to (note that checksum is valid)" [
    initialized: "+q8FcL711kn5&\Ey"
    debased: #{082A3C051C0B3B3535242739250E0432}
    shuffled: [
        #{082A3C051C0B333525242739250F041E} 
        #{280A1615080F33252F2007312D1E151E} 
        #{002002002205260005321218070A001E}
    ]
    transposed: make vector! [630 66048 139622 184816137 0]
    verified: 519x519
    reified: #[
        "Total playtime" 0:10:30
        "Trophies won" 0
        "Animals catalogued" 1
        "Pearls collected" 2
        "Zero" 0
        "YO! Pearl record" 139622
        "Locker code" "L4S9"
        "Padding zeroes" 0
    ]
]

"An example from my blog post, with data being explicitly tampered with" [
    initialized: "fCe\w9!iBXJ1ijn&"
    debased: #{1F021E0E303D3F220117093522232725}
    shuffled: [
        #{1F021E0E303D3F220117093522232725} 
        #{1722140F203B3C12293139212E352725} 
        #{03282105052119000423103507210D25}
    ]
    transposed: make vector! [48817 467201 1333337 151257859 0]
    verified: 1351x327
    reified: #[
        "Total playtime" 13:33:37
        "Trophies won" 0
        "Animals catalogued" 7
        "Pearls collected" 33
        "Zero" 1
        "YO! Pearl record" 1333337
        "Locker code" "J4D3"
        "Padding zeroes" 0
    ]
]

"The very first one back from 2017" [
    initialized: "8a1\wyRVK1L8Z2kZ"
    debased: #{3C1A350E303211150A350B3C19362419}
    shuffled: [
        #{3C1A370E303211151A352B3C19362400} 
        #{3A38150E243615311E35291A1F323000} 
        #{02201900221526000629251C18110100}
    ]
    transposed: make vector! [4620 334080 140646 218695941 0]
    verified: 792x792
    reified: #[
        "Total playtime" 1:17:00
        "Trophies won" 0
        "Animals catalogued" 5
        "Pearls collected" 25
        "Zero" 0
        "YO! Pearl record" 140646
        "Locker code" "N9J5"
        "Padding zeroes" 0
    ]
]
