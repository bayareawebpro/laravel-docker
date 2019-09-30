# Laravel Docker 2019
- http://localhost/horizon/dashboard
- http://localhost/telescope/requests

> https://devhints.io/docker-compose

### Environment
- MySQL 5.7
- PHP-FPM 7.3
- NPM (latest)
- NGINX (latest)
- Laravel (latest)
- Horizon (latest)
- OpCache (latest)
- xDebug (optional)
- Memcached (latest)
- Supervisor (latest)

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
- `docker-compose exec worker bash`
- `exit`

### Copy Files
- `docker ps` (list container IDs)
- `docker cp <containerId>:/file/path/within/container /my/path`
- `docker cp ae732473905f:/usr/local/etc ~/Desktop`
- `docker rm --force <containerId>`

### Nginx
- /etc/nginx/nginx.conf
- `docker-compose exec nginx bash`
- `service nginx status`
- `service nginx restart`

### PHP-FPM
- `docker-compose exec php bash`
- `kill -USR2 1`

### Database
The database host `DB_HOST=mysql` references the docker service IP.

- `docker-compose exec mysql bash`
- `mysql -u root -plaravel`

### Redis Cache
The database host `REDIS_HOST=redis` references the docker service IP.

- `docker-compose exec redis bash`

Configure as Auto-Expiring Cache
```
redis-cli
config set maxmemory 256mb
config set maxmemory-policy allkeys-lru
config rewrite
```

# DockerCloud
Connect a Repo to Build on Push
> https://cloud.docker.com/


# DockerMachine
> https://docs.docker.com/machine/install-machine/
> https://blog.machinebox.io/deploy-machine-box-in-digital-ocean-385265fbeafd

# DigitalOcean Image

```
git init .
git remote add origin <repository-url>
git pull origin master
```