#!/bin/bash
dir=$1

if [ -d $dir  ]; then
    mkdir $dir/pdf
    mkdir $dir/images
    mkdir $dir/csv 
else 
    echo "no such file or directory "
    exit 1
fi

for file in $dir/*; do 
    if [ -f  $file  ]; then
        case $(file --mime-type -b $file) in
           application/pdf)
               mv $file $dir/pdf
               ;;
           image/*)
               mv $file $dir/images
               ;; 
           text/csv)
               mv $file $dir/csv
               ;; 
           *)
               ;;
        esac
    fi
done
echo "Files sorted successfully."





        

