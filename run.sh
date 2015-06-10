#!/bin/bash

rm ../lib/libcrest.a
rm ../bin/run_crest
rm ../bin/process_cfg
rm ../bin/print_execution
rm ../include/crest.h

cd ../src/
make

cd ../test/

#removing previous results
rm result.txt
rm results.xlsx

#running
../bin/crestc $1.c 
../bin/run_crest ./$1 $2 -$3

#to save the results in a spreadsheet
python ../src/results/results.py $1 $2 $3

#open the spreadsheet
xdg-open results.xlsx 