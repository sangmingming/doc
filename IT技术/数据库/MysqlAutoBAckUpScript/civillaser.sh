filename=`date +%Y%m%d`
/usr/local/mysql/bin/mysqldump --opt civillaser -u root -pp@ssword0571 | gzip > /home/www/default/DBbackup/civillaser$filename.gz
