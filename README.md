# My Docker Django

## Description
This app is a django app template working on docker.
By using this app, You can easily set up Django development environment.

# To Run this app

## Setting

First, git clone this repository.
```bash
git clone git@github.com:keii1111/my_docker_django.git
```

And run the command in terminal as below.
This process is to configure the mariaDB.
Edit the part enclosed in <>.
```bash
cd ./my_docker_django/
WORKDIR=`pwd`
cd $WORKDIR/django
echo 'MYSQL_ROOT_PASSWORD=<YOUR_DB_ROOT_PASSWORD>' >> mariadb.env
echo 'MYSQL_DATABASE=mariadb' >> mariadb.env
echo 'MYSQL_USER=<YOUR_DB_USER>' >> mariadb.env
echo 'MYSQL_PASSWORD=<YOUR_DB_PASSWORD>' >> mariadb.env
```

## Start docker
```bash
cd $WORKDIR
docker-compose up --build
```

### After the 2nd time
```bash
cd $WORKDIR
docker-compose up 
```

If you want docker to work in the background,
run the command in terminal as below.
```bash
docker-compose up -d
```

## You can see starting django app.
If you access localhost on your browser,
you can see running your django application!


# Customize your django app.

## If you want to change the project name of this app
Edit django/my_docker_django_project/settings.py as below.
```python
# PROJECT_NAME = 'my_docker_django_project'
PROJECT_NAME = '<YOUR_PROJECT_NAME>'
```

And edit docker-compose.yml as below.
```
# entrypoint: ./wait-for-mariadb.sh mariadb "gunicorn my_docker_django_project.wsgi -b 0.0.0.0:3031"
entrypoint: ./wait-for-mariadb.sh mariadb "gunicorn ${YOUR_PROJECT_NAME}.wsgi -b 0.0.0.0:3031"
```

And run the command in terminal as below.
Edit the part enclosed in <>.
```bash
mv django/my_docker_django_project django/<YOUR_PROJECT_NAME>
```

## Create a new app.
Run the command in terminal as below.
Edit the part enclosed in <>.
```bash
cd $WORKDIR
docker-compose run --rm --entrypoint="" django python3 manage.py startapp <YOUR_APP_NAME>
```

## Create migration file.
Run the command in terminal as below.
```bash
cd $WORKDIR
make makemigrations
```

## Migrate database based on migration files.
Run the command in terminal as below.
```bash
cd $WORKDIR
make migrate
```

## Create the new admin user of your app.
Run the command in terminal as below.
```bash
cd $WORKDIR
make createsuperuser
```

## If you want to use django shell
Run the command in terminal as below.
```bash
cd $WORKDIR
make shell
```