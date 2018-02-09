#!/bin/bash

URL=$1
TARGET=$2

curl $URL > $TARGET.pdf

# Catch abnormal curl behavior
if [ $? != 0 ]
then 
    echo Unable to retrieve URL, sorry!
    exit 1
fi


pdftotext $TARGET.pdf

# Clean up after yourself
rm -rf $TARGET.pdf





