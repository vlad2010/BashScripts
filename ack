#!/bin/sh

#find files by mask.   14.02.2015

if [ -z "$1" ]
then
   echo "Usage: ack what_to_find [file mask]"
   exit
fi

if [ -z "$2" ]
then 
	  grep --color -r "$1" ./*
else
	  grep --color -R "$1" --include ${2} *
fi






