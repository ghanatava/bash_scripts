#!/bin/bash 

#this script removes space from file names 

dir=$1
if [ -d $dir  ];then
    find $dir -type f -name "* *" -exec rename "s/ /_/g" {} +
    if [ $? -eq 0  ]; then
        echo space removed succssfully!
    else
        echo "Unknown Error "
    fi
else
   "No such file or Directory"
fi
