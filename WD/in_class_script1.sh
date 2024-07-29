#!/bin/bash
clear
mkdir sample_folder
cd sample_folder
touch file.txt
echo "Listing the current directory "
ls -l
echo "Checking for .txt file present or not"
if ls *.txt 1> /dev/null 2>&1; then
    echo " file is present "
else
    echo " file is not present "
fi
cd ..
