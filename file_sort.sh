#!/bin/bash
dir=$1

if [ -d $dir  ]; then 
        mkdir -p $dir/pdf
        mkdir -p $dir/images
        mkdir -p $dir/text
        mkdir -p $dir/json
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
           text/plain)
               mv $file $dir/text
               ;;
           application/json)
               mv $file $dir/json
               ;;
            *)
               ;;
        esac
    fi
done
if [ $? -eq 0  ];then 
    echo Files sorted Successfully
else
    echo some error occured
fi





        

