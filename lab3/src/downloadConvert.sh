#!/bin/bash

URL=$1
FILENAME=$2

curl $URL > $FILENAME.pdf

# Catch abnormal curl behavior
if [ $? != 0 ]
then 
    echo Unable to retrieve URL, sorry!
    exit 1
fi


pdftotext $FILENAME.pdf

# Remove non ASCII characters 
#sed -i 's/[\d128-\d255]//g' $FILENAME.txt

# Delete all single characters by themselves
# (note- this may remove the word "I", but 
# can be modified)
#awk 'length!=1' $FILENAME.txt > ($FILENAME)_stripped.txt

# TODO decide if you want to operate on the stripped file
# or not. If you want to modify the file in place without
# creating a new file, rewrite as awk -i 'leng....

# Clean up after yourself
rm -rf $FILENAME.pdf





