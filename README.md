# Laravel Docker 2019

### Environment
- MySQL 5.7
- PHP-FPM 7.3
- Ngnix (latest)
- Laravel (latest)
- xDebug (optional)

### Build / Destroy Images
- `docker-compose build`
- `docker rm --force php`
- `docker rm --force mysql`
- `docker rm --force nginx`
- `docker rm --force redis`

### Start / Stop Services
- `docker-compose up` (listen)
- `docker-compose up -d` (detach)
- `docker-compose down` 

### Bash Shell
- `docker-compose exec php bash`
- `docker-compose exec mysql bash`
- `docker-compose exec nginx bash`
- `docker-compose exec redis bash`
- `exit`

### Stop Services 

### Restart Nginx
- `docker-compose exec nginx bash`
- `kill -USR2 1`

### Database (Port 3306)

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

### Stop Services
- `docker-compose down`
