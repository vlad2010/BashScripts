#!/bin/sh

#remove trailing whitespaces

sed -i '' -e's/[ \t]*$//' "$1"

