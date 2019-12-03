from .settings import *

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'myapp',
]

# Uncomment if you want to use a mysql/mariadb database. Don't forget to change docker-compose.yml!
# DATABASES = {
#     'default': {
#         'NAME': 'mydjango',
#         'ENGINE': 'django.db.backends.mysql',
#         'USER': 'root',
#         'PASSWORD': 'root',
#         'HOST': 'db',
#         'PORT': 3306,
#         'OPTIONS': {
#             'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
#         },
#         'CONN_MAX_AGE': 550,
#     }
# }

# ... add more settings, will override default settings.py
