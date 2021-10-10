#!/bin/bash

FILE=$1
CITABLE=$2
WORK=$PWD/$CITABLE.sql

echo "CREATE TABLE IF NOT EXISTS $CITABLE(ID INT UNSIGNED AUTO_INCREMENT,">$WORK
head -n 1 $FILE | sed 's/\ /_/g' | sed 's/,/\ VARCHAR\(250\)\ NOT\ NULL,\n/g'>>$WORK
echo "VARCHAR(250) NOT NULL," >> $WORK
echo "PRIMARY KEY(ID) );" >> $WORK
echo "" >> $WORK
echo "INSERT INTO $CITABLE (" >> $WORK
head -n 1 $FILE | sed 's/\ /_/g' >>$WORK
echo ") VALUES('">>$WORK
tail -n +2 $FILE | sed "s/\ /_/g"| sed "s/,/\',\'/g" | sed ':a;N;$!ba;s/\n/\%\#\^),\n(\%\#\^/g' | sed "s/\%\#\^/\'/g" >> $WORK
echo "');">>$WORK
