#!/bin/dash

#URL=$1
FILENAME=$1
DELIM=$2
#TODO set a default delim
#TODO find a way to send in a space or 
# new line as a delimiter

# Grab your pdf download link
#curl $URL > $FILENAME.pdf

# Catch abnormal curl behavior
if [ $? != 0 ]
then 
    echo Unable to retrieve URL, sorry!
    exit 1
fi

# Use pdftotext utility
pdftotext $FILENAME.pdf

# Remove non ASCII characters 
LANG=C sed -i 's/[\d128-\d255]/'$DELIM'/g' $FILENAME.txt

# Try to remove all tabs, breaks, new lines
LANG=C sed -i 's/[\x00 - \x1f]/'$DELIM'/g' $FILENAME.txt

# The comma followed by a space is replaced by a comma
#LANG=C sed -i 's/, /'$DELIM'/g' $FILENAME.txt

# From the ascii table, delete other non letters
LANG=C sed -i 's/[\d0-\d64]/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/[\d91-\d96]/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/[\d123-\d127]/'$DELIM'/g' $FILENAME.txt

# Remove all new lines again
LANG=C sed -i 's/,\x0d/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/,\x0a/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/,\n/'$DELIM'/g' $FILENAME.txt


# Take out all those extra delimiters we may have made
LANG=C sed -i 's/'$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM'/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/'$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM'/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/'$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM'/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/'$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM'/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/'$DELIM$DELIM$DELIM$DELIM$DELIM$DELIM'/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/'$DELIM$DELIM$DELIM$DELIM$DELIM'/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/'$DELIM$DELIM$DELIM$DELIM'/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/'$DELIM$DELIM$DELIM'/'$DELIM'/g' $FILENAME.txt
LANG=C sed -i 's/'$DELIM$DELIM'/'$DELIM'/g' $FILENAME.txt

# Strip all letters by themselves
# TODO find a better way to do this (this doesnt work anyways)
#LANG=C sed -i 's/,a,/,/g' $FILENAME.txt
#LANG=C sed -i 's/,b,/,/g' $FILENAME.txt
#LANG=C sed -i 's/,b,/,/g' $FILENAME.txt

# Delete all single characters by themselves
#awk 'length!=1' $FILENAME.txt > $FILENAME.txt

# Clean up after yourself
#rm -rf $FILENAME.pdf
