# django-docker-playground
Keep you django experiments clean

## Summary
Only your code visible, the rest is kept in the container. Great for experimenting with new features or packages and you want to keep track of your own code and separate the environments. Based on lightweight alpine python docker image.

## Getting started
1. Clone or fork the repo
2. Run `docker-compose up`
3. Visit localhost:8000 for example view

## Add more isolated projects
1. duplicate the `myproject` folder
2. edit `docker-compose.yml` and add a new service

## Adding packages
1. Update `requirements.txt`
2. Run `docker-compose build myproject`, 

## Use mysql/mariadb
To use mariadb as database instead of default sqlite, uncomment db/mysql related lines in
- `docker-compose.yml`
- `settings_override.py`
- `Dockerfile`
- `requirements.txt`

## Other useful commands 
```bash
# only run one project
docker-compose up myproject

# open shell in container
docker-compose exec myproject /bin/sh
```
