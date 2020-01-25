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
python manage.py migrate && gunicorn my_docker_django_project.wsgi -b 0.0.0.0:3031

exec $cmd