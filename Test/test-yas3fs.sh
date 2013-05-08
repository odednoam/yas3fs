#!/usr/bin/env bash

FILEPATH=$1

while :
do

    NUMFILES=`find $FILEPATH -type f|wc -l`
    N=`echo "$NUMFILES * $RANDOM / 32767"|bc`
    echo "File Number is $N out of $NUMFILES"

    FILENAME=`find $FILEPATH -type f|sed -n ${N}p`
    echo "File name is: $FILENAME"

    SIZE=`cat $FILENAME|wc -c`
    echo "File size is: $SIZE"

    START=`echo "$RANDOM * $SIZE / 32767"|bc`
    echo "Start at: $START"

    END=`echo "$START + $RANDOM * ($SIZE - $START) / 32767"|bc`
    echo "End is: $END" 

    echo "Reading "$FILENAME" form $START to $END ..."
    cut -b $START-$END $FILENAME > /dev/null
    echo "Done!"

done
