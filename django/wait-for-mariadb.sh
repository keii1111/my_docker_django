#!/bin/bash

set -e
. ./mariadb.env

host="$1"
shift
cmd="$@"

until mysql --host="$host" --user="$MYSQL_USER" --password="$MYSQL_PASSWORD" -e "show databases;"  "$MYSQL_DATABASE" ; do
    >&2 echo "MariaDB is unavailable -sleeping"
    sleep 1
done

>&2 echo "MariaDB is up -executing command"

exec $cmd