filename=`date +%Y%m%d`
/usr/local/mysql/bin/mysqldump --opt hanlinwa -u root -pp@ssword0571 | gzip > /home/www/default/DBbackup/hanlinwa$filename.gz
