git clone this repository.

cd ./my_docker_django/
export WORKDIR=`pwd`

docker build -t django3.0 -f $WORKDIR/django/Dockerfile.base ./django

# optional
cd $WORKDIR/django
docker run --rm \
  --mount type=bind,src=$(pwd),dst=/opt/code \
  django3.0 \
  django-admin startproject my_docker_django_project .

edit your $WORKDIR/django/my_docker_django_project/settings.py 


# edit db settings
cd $WORKDIR/docker
echo 'MYSQL_ROOT_PASSWORD=<YOUR_DB_ROOT_PASSWORD>' >> mariadb.env
echo 'MYSQL_DATABASE=mariadb' >> mariadb.env
echo 'MYSQL_USER=<YOUR_DB_USER>' >> mariadb.env
echo 'MYSQL_PASSWORD=<YOUR_DB_PASSWORD>' >> mariadb.env

cd $WORKDIR/django
echo 'USER=<YOUR_DB_USER>' >> .env
echo 'PASSWORD=<YOUR_DB_PASSWORD>' >> .env

# start docker
cd $WORKDIR/docker
docker-compose up --build

# you can see starting django apps
access localhost on your browser.