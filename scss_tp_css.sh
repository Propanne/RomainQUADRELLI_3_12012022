#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/roqua/svn/admsys/trunk/hosting/bin
WEB_PATH=/var/www/html/P3_QUADRELLI_code
CSS_PATH=/var/www/html/P3_QUADRELLI_code/css
SCSS_PATH=/var/www/html/P3_QUADRELLI_code/scss

#FLUSH CSS FOLDER
rm $CSS_PATH/*
for folder in $(ls $SCSS_PATH)
do
	for file in $(ls $SCSS_PATH/$folder)
	do
		if [ ! -z $file ]
		then
			fwthoutext=$(echo $file|cut -d"." -f1)
			sass $SCSS_PATH/$folder/$file $CSS_PATH/$fwthoutext.css
		fi
	done
done

#FLUSH IF NEEDED AFTER CONVERSION
if [ ! -z $1 ]
then
	if [ $1 = "flush" ]
	then
		rm $CSS_PATH/*
	fi
fi
