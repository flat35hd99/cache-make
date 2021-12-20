#!/bin/bash

before=$1;
after=$2;

echo $before;
echo $after;

git ls-files | while read -r line;
do
    st=$(git diff --name-status $before $after $line);
    echo $st;
    echo "Unchanged files:";
    if [ -n $st ]; then
        echo $st;
        touch --date=@0 $st;
    fi;
done
