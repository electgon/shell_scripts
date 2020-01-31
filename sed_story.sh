#!/bin/bash

##
export FileContent='Creating text that shall be used \nfor sed example'
export Replacingtx='this text will be used \nfor sed example'
echo -e $FileContent > sed_file.txt
set cnt=0

## sed syntax
## sed [option]'command' ProcessedFile

##Append some text before end of file
sed -i '$i Text has been added' sed_file.txt
cnt=$((cnt+1))


##Insert some text after end of file
sed -i '$a BYE' sed_file.txt
cnt=$((cnt+1))

##Insert some text before line that contains specific string
sed -i '/Creating/i Welcome String' sed_file.txt
##after the line
sed -i '/Creating/a Welcome again String' sed_file.txt
cnt=$((cnt+1))

##substitute a variable in the string
sed -i '$a So far, No. of Operations = '"${cnt}"'' sed_file.txt
cnt=$((cnt+1))

##search for a text and replace it in all occurence
## note that used separator here is +. It can be / also, it doesn't matter
##s for search. g for global
sed -i 's+example+story+g' sed_file.txt
cnt=$((cnt+1))

##String formatting
sed -i '/BYE/i logic:\
if (month = Jan) (\
\tprint(it has 31 days)\
)\
end if\
' sed_file.txt
cnt=$((cnt+1))


##To find lines numbers that contains certain pattern
sed -n "/logic:/,/if$/=" sed_file.txt
##note here we searched starting form line that has "logic"
##to line that ends with "if". = is used to print line number

##to find line that contains certain pattern that comes after certain patttern in specific group of lines
sed -n "/logic:/,/if$/{/has/p}" sed_file.txt
#note that p is used to print the line.


##_______Replacement__________
## Replace a whole line that contains certain pattern
sed -i "/that shall/c $Replacingtx" sed_file.txt

#sed -i '$i Operations = shall be updated' sed_file.txt
#sed -i 's/\(Operations = \)\(.*\)\(be\)/\3'"${cnt}"'/' sed_file.txt


sed -i 's/\(Operations = \)\(.*\)/\1'"${cnt}"'/' sed_file.txt
#s : for search
#(Operations =) : First group: sed searches for the content "Operations ="
#(.*) : Second group: Include any characters after the first group into second group
#\1 : back reference to the first group; i.e. start replacement after first group.
#if \2 is used, it will remove first group and add need text after second group
#${cnt}: variable to replace with


## EOF ###