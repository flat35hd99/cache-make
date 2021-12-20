#!/bin/bash

before=$1;
after=$2;

echo "Unchanged files:"

git ls-files | while read -r line;
do
    st=$(git diff --name-status "$after" "$before" "$line");
    if [ -n "$st" ]; then
        unchanged_file=$(echo $st | awk '{print $2}')
        echo $unchanged_file
        touch --date=@0 $unchanged_file
    fi;
done
