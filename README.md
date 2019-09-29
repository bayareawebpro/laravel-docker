# Laravel Docker 2019

### Environment
- MySQL 5.7
- PHP-FPM 7.3
- Ngnix (latest)
- Laravel (latest)
- xDebug (optional)

### Build Images
- `docker-compose build`

### Mange Services
- `docker-compose up` (listen)
- `docker-compose up -d` (detach)
- `docker-compose down` 

### Bash Shell
- `docker-compose exec php bash`
- `docker-compose exec mysql bash`
- `docker-compose exec nginx bash`
- `docker-compose exec redis bash`
- `exit`

### Copy Files
- `docker ps` (list container IDs)
- `docker cp <containerId>:/file/path/within/container /my/path`
- `docker cp ae732473905f:/usr/local/etc ~/Desktop`
- `docker rm --force <containerId>`


### Nginx
- /etc/nginx/nginx.conf
- `docker-compose exec nginx bash`
- `kill -USR2 1`

### Database

The database host `DB_HOST=mysql` references the docker service IP.

- `docker-compose exec mysql bash`
- `mysql -u root -plaravel`

```
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=laravel
```
