@echo off

setlocal EnableDelayedExpansion
REM You always have to use SETLOCAL ENABLEDELAYEDEXPANSION and !...! instead of %...% when working with variables which are modified inside a loop.

set "_file=..\kolbot\logs\D2BotManagerConsole.log"


if exist !_file! (

	for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c_%%a_%%b)
	for /f "tokens=1-3 delims=/:" %%a in ("%TIME: =0%") do (set mytime=%%a_%%b_%%c)
	set "_datetime=!mydate!_!mytime!"
	REM echo !_datetime!
	
	:: Parse Method 1: parse last X lines
	set /a _lastXLines=1000
	set "_lines=last_!_lastXLines!"
	bin\tail -n !_lastXLines! !_file! > D2BotManagerConsole_part.log
	
	:: Add line numbers to file  http://tuxthink.blogspot.com/2012/01/adding-line-numbers-to-file.html
	bin\sed "/./=" D2BotManagerConsole_part.log | bin\sed "/./N; s/\n/) /" > D2BotManagerConsole_part2.log

	:: Regex the file for proper html output (ie. converting game color codes to CSS classes)
	bin\sed -E -f regex.sh D2BotManagerConsole_part2.log > D2BotManagerConsole_edited.html

	:: Attach the header and footer htmls to our html log file
	type _header.html D2BotManagerConsole_edited.html _footer.html > logs\D2BotManagerConsole_lines_!_lines!_!_datetime!.html

	:: Clean up junk files
	del D2BotManagerConsole_part.log D2BotManagerConsole_part2.log D2BotManagerConsole_edited.html

	:: Launch parse log html in Chrome browser
	start chrome logs\D2BotManagerConsole_lines_!_lines!_!_datetime!.html
) else (
   echo Couldnt find D2BotManagerConsole.log. Make sure you placed this folder in your D2BotManagerConsole folder!
)

timeout 2
REM pause


