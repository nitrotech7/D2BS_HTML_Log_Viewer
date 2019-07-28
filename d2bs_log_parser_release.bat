@echo off

setlocal EnableDelayedExpansion

if exist ..\d2bs.log (
	:: Extract Method 1: get last X lines
	set /a _lastXLines=700
	set "_lines=last_!_lastXLines!"
	bin\tail -n !_lastXLines! ..\d2bs.log > d2bs_part.log

	:: Extract Method 2: get lines from-to
	REM set /a _lineFrom=21500
	REM set /a _lineTo=22500
	REM set "_lines=!_lineFrom!-!_lineTo!"
	REM bin\sed -n "!_lineFrom!,!_lineTo!p" ..\d2bs.log > d2bs_part.log

	:: Add line numbers to file  http://tuxthink.blogspot.com/2012/01/adding-line-numbers-to-file.html
	bin\sed "/./=" d2bs_part.log | sed "/./N; s/\n/\| /" > d2bs_part2.log

	:: Regex the file for proper html output
	bin\sed -E -f sed.sh d2bs_part2.log > d2bs_edited.html

	:: prepend html/css/fonts/pix data to our html log file
	type _header.html d2bs_edited.html _footer.html > d2bs_lines_!_lines!.html

	:: clean up junk files
	del d2bs_part.log d2bs_part2.log d2bs_edited.html

	:: launch parse log html in Chrome browser
	start chrome ./d2bs_lines_!_lines!.html
) else (
   echo Couldnt find d2bs.log. Make sure you placed this folder in your d2bs folder!
)

timeout 2
REM pause