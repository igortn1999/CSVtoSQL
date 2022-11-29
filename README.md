# CSVtoSQL
A useful script that converts a .CSV file into a .SQL file

This script should be run providing two parameters: first the .csv file and second the output .sql script name.
Eg:
$ ./CSVtoSQL.sh YourCSVHere.csv SqlFileName

The output will be a file called SqlFileName.sql

IMPORTANT: 
At the moment, all the data types fore every column will be a VARCHAR with space available for 250 characters
