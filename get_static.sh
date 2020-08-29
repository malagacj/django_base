#! /bin/bash

# Creating static folder
project_name=`basename $(pwd)`

if [ ! -d $project_name/static ]; then
	mkdir $project_name/static
fi

root_url="https://github.com/mdbootstrap/"
urls="Landing-page-Template-Bootstrap/archive/master.zip Admin-Dashboard-Template-Bootstrap/archive/master.zip Blog-Template-Bootstrap/archive/master.zip Ecommerce-Template-Bootstrap/archive/master.zip"

cd $project_name/static

for url in $urls
do
	filename=`echo $url | sed "s/-Template.*$//g"`
	rm -rf $filename

	wget -O $filename.zip $root_url$url
	unzip -d $filename $filename.zip; rm $filename.zip

	old_filename=`ls $filename`
	mv $filename/$old_filename/* $filename
	rm -rf $filename/$old_filename
done
