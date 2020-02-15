FROM python:3.8

RUN mkdir /opt/code

ENV APP_PATH /opt/code

COPY . $APP_PATH/
WORKDIR $APP_PATH

RUN chmod 775 ./wait-for-mariadb.sh
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r $APP_PATH/requirements.txt
RUN apt-get update && apt-get install -y mariadb-client

CMD python manage.py collectstatic --noinput