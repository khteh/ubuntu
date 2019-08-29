#!/bin/bash
echo User: $MYSQL_USER
echo Host: $MYSQL_HOST
echo Database: $MYSQL_DATABASE
mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOST $MYSQL_DATABASE < /usr/local/bin/db.sql
