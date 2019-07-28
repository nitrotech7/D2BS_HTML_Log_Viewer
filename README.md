# D2BS HTML Log Viewer
Parses d2bs.log into html form converting game text color codes into CSS classes for easier viewing in the web browser +searchability.
	
## About
I made this tool for easier viewing of the d2bs.log file, which is basically whatever is outputed in the console during botting. Since [d2bs](https://github.com/noah-/d2bs) unfortunately has no debugger atm, if you are making custom kolbot scripts you often have to use print(); commands throughout your code to know wtf your bot is actually doing. You can view the console in game by pressing the Home key, but the text is terribly hard to read and analyze (D2 is a 20 year old so resolution sucks bad). So to make it easier to analyze the console output I created this niffty tool that parses the log file (according to the amount of lines you want it to return), replaces the in-game color codes to CSS color classes and outputs an html file that auto opens in Chrome after finishing (~2 sec). 

## Usage
Place the master folder in your d2bs folder (ie. D:\Games\D2kolbot\trunk\d2bs\D2BS_HTML_Log_Viewer). Open D2BS_HTML_Log_Viewer.bat in a text editor and set the parsing method to 1 or 2 based on how you want to parse the log file: last X lines -OR- from line X to line Y. Then configure these numbers to whatever line numbers you want to parse. When done, save it and run it. The html file will automatically open in Chrome (change to whatever web browser you use in the batch file).

### Sample screenshots:

![Imgur](https://i.imgur.com/oHZcDAN.jpg)
![Imgur](https://i.imgur.com/sZ41sr9.jpg)
