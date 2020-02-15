makemigrations:
	docker-compose run --rm --entrypoint="./wait-for-mariadb.sh mariadb" django python3 manage.py makemigrations

migrate:
	docker-compose run --rm --entrypoint="./wait-for-mariadb.sh mariadb" django python3 manage.py migrate

createsuperuser:
	docker-compose run --rm --entrypoint="./wait-for-mariadb.sh mariadb" django python3 manage.py createsuperuser

shell:
	docker-compose run --rm --entrypoint="./wait-for-mariadb.sh mariadb" django python3 manage.py shell