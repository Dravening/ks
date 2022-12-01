#!/bin/bash
echo "service mysql status"

echo 'starting mysql....'
service mysql start

sleep 1

echo "service mysql status"

exist=`mysql -e 'show databases;' | grep 'datathread'`;

if [ ! -n "$exist"  ];then
  echo 'data.sql importing....'
  mysql < /mysql/sql/data.sql
  echo 'data.sql imported....'

  sleep 1;

  echo 'privileges.sql importing....'
  mysql < /mysql/sql/privileges.sql
  echo 'privileges.sql imported....'

  sleep 1;

  echo "service mysql status"
else
  echo 'datathread exist.no need to init.'
fi;

echo "success!"
tail -f /dev/null;
