@echo off

setlocal EnableDelayedExpansion

:: Extract Method 1: get last X lines
set /a _lastXLines=700
set "_lines=last_%_lastXLines%"
bin\tail -n %_lastXLines% ..\d2bs.log > d2bs_part.log

:: Extract Method 2: get lines from-to
REM set /a _lineFrom=21500
REM set /a _lineTo=22500
REM set "_lines=%_lineFrom%-%_lineTo%"
REM bin\sed -n "%_lineFrom%,%_lineTo%p" ..\d2bs.log > d2bs_part.log

:: Add line numbers to file  http://tuxthink.blogspot.com/2012/01/adding-line-numbers-to-file.html
bin\sed "/./=" d2bs_part.log | sed "/./N; s/\n/\| /" > d2bs_part2.log


:: Regex the file for proper html output  REM -e "s/\[.*D2BS [0-9]+://" 
bin\sed -E -e "s/D2BS [0-9]+: //" -e "s/^/<span class='linenums'>/" -e "s/\| \[/<\/span>\| \[/" -e "s/^/<div class='line'>/" -e "s/$/<\/div>/" -e "s/\xC3\xBFc[0-9:;]{1}/<span class='\0'>/g" -e "/span/ s/<span/<\/span><span/g" -e "s/<\/span><span/<span/" -e "/span/ s/<\/div>/<\/span><\/div>/" -e "s/\xC3\xBFc0/white/g" -e "s/\xC3\xBFc1/red/g" -e "s/\xC3\xBFc2/green/g" -e "s/\xC3\xBFc3/blue/g" -e "s/\xC3\xBFc4/gold/g" -e "s/\xC3\xBFc5/grey/g" -e "s/\xC3\xBFc6/black/g" -e "s/\xC3\xBFc7/lightgold/g" -e "s/\xC3\xBFc8/orange/g" -e "s/\xC3\xBFc9/yellow/g" -e "s/\xC3\xBFc:/darkgreen/g" -e "s/\xC3\xBFc;/purple/g" d2bs_part2.log > d2bs_edited.html

:: prepend html/css/fonts/pix data to our html log file
type _header.html d2bs_edited.html _footer.html > d2bs_lines_%_lines%.html

:: clean up junk files
del d2bs_part.log d2bs_part2.log d2bs_edited.html

:: launch parse log html in Chrome browser
start chrome ./d2bs_lines_%_lines%.html


timeout 1
REM pause
