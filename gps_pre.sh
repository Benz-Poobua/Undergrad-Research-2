#!/bin/sh

# gnu sed
GSED=$(brew info gsed | \
  grep "gnubin:" | \
  sed -e 's/.*=//g' -e 's/:.*/\/sed/g' -e 's/"//g')

wget -O $2.temp $1

cat $2.temp | \
  grep '#' | \
  tail -n1 | \
  $GSED -e 's/#//' -e 's/ \+/,/g' -e 's/,//' > $2

cat $2.temp | \
  grep -v '#' | \
  $GSED -e 's/#.*\n//g' -e 's/ \+/,/g' -e 's/,//' >> $2

rm $2.temp

