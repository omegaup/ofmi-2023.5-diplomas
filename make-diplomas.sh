#!/bin/bash

while IFS=, read -r cpath cname cbackgroundtype cmedalla
do
	echo "name,backgroundtype,medalla" > contestants.csv
        echo "$cname,$cbackgroundtype,$cmedalla" >> contestants.csv

	latexmk -pdflatex=lualatex -pdf main.tex

	path="output/$cpath"
	mkdir -p "`dirname $path`"
	mv main.pdf "$path"
done < everyone.csv

zip -r all-documents output
