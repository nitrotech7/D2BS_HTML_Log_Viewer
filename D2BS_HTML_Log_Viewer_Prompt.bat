@echo off

setlocal EnableDelayedExpansion
REM You always have to use SETLOCAL ENABLEDELAYEDEXPANSION and !...! instead of %...% when working with variables which are modified inside a loop.

if exist ..\d2bs.log (

	for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c_%%a_%%b)
	for /f "tokens=1-3 delims=/:" %%a in ("%TIME: =0%") do (set mytime=%%a_%%b_%%c)
	set "_datetime=!mydate!_!mytime!"
	echo !_datetime!

	:: Set line parsing method to 1 or 2
	echo Set line parsing method to 1 or 2
	set /p _method=
	
	:: Parse Method 1: parse last X lines
	if !_method!==1 (
		echo How many last lines do u want to parse? 
		set /p _lastXLines=
		set "_lines=last_!_lastXLines!"
		bin\tail -n !_lastXLines! ..\d2bs.log > d2bs_part.log
	)
	
	:: Parse Method 2: parse lines from X to Y
	if !_method!==2 (
		echo Lines to parse from:
		set /p _lineFrom=
		echo Lines to parse to:
		set /p _lineTo=
		set "_lines=!_lineFrom!-!_lineTo!"
		bin\sed -n "!_lineFrom!,!_lineTo!p" ..\d2bs.log > d2bs_part.log
	)
	

	:: Add line numbers to file  http://tuxthink.blogspot.com/2012/01/adding-line-numbers-to-file.html
	bin\sed "/./=" d2bs_part.log | sed "/./N; s/\n/\| /" > d2bs_part2.log

	:: Regex the file for proper html output (ie. converting game color codes to CSS classes)
	bin\sed -E -f sed.sh d2bs_part2.log > d2bs_edited.html

	:: Attach the header and footer htmls to our html log file
	type _header.html d2bs_edited.html _footer.html > logs\d2bs_lines_!_lines!_!_datetime!.html

	:: Clean up junk files
	del d2bs_part.log d2bs_part2.log d2bs_edited.html

	:: Launch parse log html in Chrome browser
	start chrome logs\d2bs_lines_!_lines!_!_datetime!.html
) else (
   echo Couldnt find d2bs.log. Make sure you placed this folder in your d2bs folder!
)

timeout 2
REM pause