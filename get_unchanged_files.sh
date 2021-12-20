#!/bin/bash

before=$1
after=$2

git ls-files | while read -r line;
do
    st=$(git diff --name-only $before $after $line);
    echo "Unchanged files:"
    if [ -n $st ]; then
        echo $st;
        touch --date=@0 $st;
    fi;
done
