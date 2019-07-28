# d2bs_log_html_viewer
Parses d2bs.log into html form, converting color codes into CSS classes for easier viewing in web browser.

**About**
I made this tool for easier viewing of the d2bs.log file, which is basically whatever is outputed in the console during botting. Since d2bs has no debugger (unfortunately), if you are making custom kolbot scripts you often have to use print() commands to know wtf your bot is actually doing. You can view the console in game by pressing the Home key, but the text is terribly hard to read and analyze (D2 is a 20 year old so resolution sucks bad). So to make it easier to analyze the console output I created this niffty and simple tool that parses the log file, replaces the in-game color codes to CSS color classes and outputs an html file that auto opens in Chrome after finishing (~2 sec). 

**Usage**
You simply place this folder in your d2bs folder (ie. D:\Games\D2kolbot\trunk\d2bs) and run d2bs_log_parser.bat, thats it! Enjoy :) Screenshots below.
