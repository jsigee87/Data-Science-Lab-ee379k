#!/bin/bash

#########################################################
###############     WARNING         #####################
#########################################################

# This script removes all pdf and text files in the folder
# that you put it in.


echo "This will delete all .pdf and .txt files in your current directory..."
echo "Are you sure you want to do this? [y/n]"
read INPUT
if [[ ! $INPUT =~ ^[Yy]$ ]]
then
    echo "Process aborted..."
    echo
    exit 1
fi
echo "Removing all pdf and txt files from current directory."
rm -rf *pdf
rm -rf *txt
