#!/bin/bash

if [ ! -d log ]
then
	mkdir log
fi

current=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for process in $current
do
	process_name=$(ps -p $process -o comm=) 
	echo -n $(date +%F) - $(date +%H:%M:%S) >> log/"$process_name".log
	memory=$(ps -p $process -o size | grep [0-9])
	memory=$(bc <<< "scale=2;$memory/1024")
	echo ""- $memory "MB" >> log/"$process_name".log
done
