#!/bin/sh

# Tool to run Astyle only for git files which are staged to commit in git  

RULES_PATH="/Users/${USER}/Applications/astyle/build/mac/bin"
RULES_FILE="csharp.astyle"

git status >> /dev/null 2>>/dev/null
ret=$?
echo "Code is " $ret

if [ $ret -ne 0 ]; then
    echo "Error: We are not in working GIT tree"
    exit 1
fi

FILES=`git diff --name-only --cached`

while read -r line; do
    #echo "Next file: $line"

    # check it is file and file exists
    if [ -f ${line} ]
    then
    	#echo "File found!"

    	AStyle --options="${RULES_PATH}/${RULES_FILE}" $line
		ret=$?
		if [ $ret -ne 0 ]; then
    		echo "Error: Astyle was teminater with error"
    		exit 1
		fi
	else 
		echo "File not found: ${line}"
	fi

done <<< "$FILES"




