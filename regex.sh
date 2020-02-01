s/D2BS [0-9]+: // 
s/^/<span class='linenums'>/ 
s/\[/<\/span><span class='datetime'>\[/
s/\]/\]<\/span> /
s/^/<div class='line'>/ 
s/$/<\/div>/ 
s/\xC3\xBFc[0-9:;%!]{1}/<span class='\0'>/g 
/span/ s/<span/<\/span><span/g 
s/<\/span><span/<span/ 
/span/ s/<\/div>/<\/span><\/div>/ 
s/\xC3\xBFc0/white/g 
s/\xC3\xBFc1/red/g 
s/\xC3\xBFc2/green/g 
s/\xC3\xBFc3/blue/g 
s/\xC3\xBFc4/gold/g 
s/\xC3\xBFc5/grey/g 
s/\xC3\xBFc6/black/g 
s/\xC3\xBFc7/lightgold/g 
s/\xC3\xBFc8/orange/g 
s/\xC3\xBFc9/yellow/g 
s/\xC3\xBFc:/darkgreen/g 
s/\xC3\xBFc;/purple/g
s/\xC3\xBFc%/white2/g
s/\xC3\xBFc!/white2/g
