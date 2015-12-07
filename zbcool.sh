#!/bin/bash
# script for turning off zbackup if the computer gets too hot, then
# turning it back on when things are cooler.

while true; do

#/usr/local/bin/getthermal > /dev/null
/usr/local/bin/getthermal
if [ $? -eq 0 ]
then
echo "starting zbackup at once."
killall -CONT zbackup
fi

if [ $? -eq 1 ]
then
echo "sleeping, starting zbackup."
sleep 300
killall -CONT zbackup
fi

if [ $? -eq 2 ]
then
echo "suspending zbackup."
killall -STOP zbackup
fi

sleep 60
done
