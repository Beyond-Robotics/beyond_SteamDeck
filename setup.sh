#!/bin/bash

SCRIPT_PATH="$(dirname $(readlink -f "${BASH_SOURCE[0]}"))"
FILES=$(grep -rl \@\@REPO_PATH\@\@ $SCRIPT_PATH --exclude setup.sh)

#FILLING FILES
for file in $FILES
do
    sed -i -e "s|@@REPO_PATH@@|$SCRIPT_PATH|g" $file
done
 
cp ${SCRIPT_PATH}/desktop_apps/*.desktop ~/Desktop

# ADDING EXEC PERMISSIONS TO SCRIPTS
SCRIPTS=$(find . -name "*.sh")
for script in $SCRIPTS
do
    chmod +x $script
done
