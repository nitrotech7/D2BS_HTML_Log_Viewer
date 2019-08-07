@echo off

setlocal enableextensions enabledelayedexpansion
REM You always have to use SETLOCAL ENABLEDELAYEDEXPANSION and !...! instead of %...% when working with variables which are modified inside a loop.

if exist ..\d2bs.log (

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

	:: Prepend html/css/fonts/pix data to our html log file
	type _header.html d2bs_edited.html _footer.html > d2bs_lines_!_lines!.html

	:: Clean up junk files
	del d2bs_part.log d2bs_part2.log d2bs_edited.html

	:: Launch parse log html in Chrome browser
	start chrome ./d2bs_lines_!_lines!.html
) else (
   echo Couldnt find d2bs.log. Make sure you placed this folder in your d2bs folder!
)

timeout 2
REM pause