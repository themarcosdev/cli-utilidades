#!/bin/sh

print_progress() {
    progress=$1
    length=$((progress / 10))
    bar="["
    i=0
    while [ $i -lt $length ]; do
        bar="$bar="
        i=$((i + 1))
    done
    i=$length
    while [ $i -lt 10 ]; do
        bar="$bar "
        i=$((i + 1))
    done
    bar="$bar] $progress%"
    printf "\r%s" "$bar"
}

progress=0

while [ $progress -le 100 ]; do
    print_progress $progress
    progress=$((progress + 10))
    sleep 1
done

echo ""
