#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/roqua/svn/admsys/trunk/hosting/bin
WEB_PATH=/var/www/html/P3_QUADRELLI_code
CSS_PATH=/var/www/html/P3_QUADRELLI_code/css
SCSS_PATH=/var/www/html/P3_QUADRELLI_code/scss

for folder in $(ls $SCSS_PATH)
do
	for file in $(ls $SCSS_PATH/$folder)
	do
		if [ ! -z $file ]
		then
			sass $SCSS_PATH/$folder/$file $CSS_PATH/$file
		fi
	done
done

if [ $1 = "flush" ]
then
	rm $CSS_PATH/*
fi
