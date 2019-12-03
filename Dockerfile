FROM python:3.6-alpine

ENV PYTHONUNBUFFERED 1

COPY requirements.txt requirements.txt

# OPTIONAL SUPPORT FOR MYSQL/MARIADB
# UNCOMMENT
# Keep track of build deps and remove them after build for minimal image
# RUN apk add --no-cache ca-certificates mariadb-connector-c-dev
# RUN apk add --no-cache --virtual .build-deps \
#     build-base mariadb-dev \
#     linux-headers musl-dev && \
#     pip install -r requirements.txt && \
#     find /usr/local \
#     \( -type d -a -name test -o -name tests \) \
#     -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
#     -exec rm -rf '{}' + && \
#     runDeps="$( \
#     scanelf --needed --nobanner --recursive /usr/local \
#     | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
#     | sort -u \
#     | xargs -r apk info --installed \
#     | sort -u \
#     )" && \
#     apk add --virtual .rundeps $runDeps && \
#     apk del .build-deps

RUN mkdir /app
WORKDIR /app

# Creates django project with all needed files
RUN django-admin startproject mydjango .

# Create admin:admin
# RUN python manage.py migrate && echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@mydjango.com', 'admin')" | python manage.py shell

ENV DJANGO_SETTINGS_MODULE=mydjango.settings_override

# Add if you want to use a entrypoint for custom commands
#COPY docker-entrypoint.sh /usr/local/bin/
#ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


