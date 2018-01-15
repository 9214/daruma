Red [
	Title: "BG&E Internet code decoder"
	Author: "https://github.com/9214"
	Version: 1.2.1.5
	Icon: %../misc/mdisk.ico
	Needs: View
]

#include %utils.red
#include %datasheet.red
#include %picklock.red
#include %converter.red
#include %decoder.red
#include %interface.red
repo: https://github.com/9214/daruma
system/view/capturing?: yes
unless unlock [view/flags window [no-min no-max]]
