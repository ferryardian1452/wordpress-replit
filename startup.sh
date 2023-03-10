#! /bin/bash
unzip phpmyadmin.zip
wp core download
rm -r phpmyadmin.zip
cat <<EOF > $HOME/$REPL_SLUG/data/my.cnf
[server]
datadir=$HOME/$REPL_SLUG/data
bind-address = 127.0.0.1
log-error=_database.err
innodb-log-file-size=4194304
lower_case_table_names=1
log-bin=binlog
EOF

export MYSQL_HOME=$HOME/$REPL_SLUG/data
echo $MYSQL_HOME
mysqld_safe > mariadb.log &
php -S 0.0.0.0:443 -t .
