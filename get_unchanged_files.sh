#!/bin/bash

before=$1;
after=$2;

git ls-files | while read -r line;
do
    st=$(git diff --name-status "$after" "$before" "$line");
    if [ -n "$st" ]; then
        changed_file=$(echo $st | awk '{print $2}')
        echo "Changed file: ${changed_file}"
        # touch --date=@0 $unchanged_file
    else
        unchanged_file=$line
        echo "Unchanged file: ${unchanged_file}"
        touch --date=@0 $unchanged_file
    fi;
done
