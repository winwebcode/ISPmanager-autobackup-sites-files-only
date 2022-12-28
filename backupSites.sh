#!/bin/bash
#Before launch make 'dos2unix yourscriptname.sh'
#script for backing up each site to a individual archive.
#for works you need set chmod 700 for script.sh, add site paths, one per line into file 'sites_directories.list', for example - '/var/www/username/data/www/yourdomain.com'

DATE=`date +%d-%m-%Y` #date
DEFAULT_DIR=/home/mybackup/files/$DATE

if ! [ -d $DEFAULT_DIR ]; then
	mkdir -p $DEFAULT_DIR  
fi

echo -e "\nBackup has started, wait...\n"
SITES_DIRECTORIES_ARR="sites_directories.list"
IFS=$'\n' ######look https://habr.com/ru/company/ruvds/blog/325928/
for siteDir in $(cat $SITES_DIRECTORIES_ARR)
do
DOMAIN=$(basename $siteDir)
echo -e "\nsite directory - $siteDir"
echo -e "\nsite name - $DOMAIN\n"
COMPRESSED_FILE_FULL_PATH=$DEFAULT_DIR/$DOMAIN\_$DATE\_lswb.tar.gz
tar -czvf - $siteDir > $COMPRESSED_FILE_FULL_PATH
done

echo -e "\nFinished!\n"