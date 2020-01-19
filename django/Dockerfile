FROM django3.0:latest

ENV APP_PATH /opt/code

COPY . $APP_PATH/
RUN pip install --no-cache-dir -r $APP_PATH/requirements.txt

WORKDIR $APP_PATH
RUN python manage.py collectstatic --noinput