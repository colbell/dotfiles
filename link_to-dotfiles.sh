#!/bin/sh

SCRIPT_DIR=$(echo $0 | sed -e 's/\(.*\)\/.*/\1/')
SCRIPT_FILE=$(echo $0 | sed -e 's/.*\///')
[ "$SCRIPT_DIR" = "." ] && SCRIPT_DIR=$(pwd)

for F in $(/bin/ls $SCRIPT_DIR | grep -v $SCRIPT_FILE)
do
   echo -n "$SCRIPT_DIR/$F: "
   if [ -e "$HOME/.$F" ]; then
       echo "~/.$F already exists, skipping."
   else
       if ln -s "$SCRIPT_DIR/$F" "$HOME/.$F"; then
           echo "linked to ~/.$F."
       fi
   fi
done
