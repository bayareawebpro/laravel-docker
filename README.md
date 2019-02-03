# laravel-docker

# Environment
-PHP-FPM 7.2
-MySQL 5.7
-Laravel 5.7
-Ngnix 1.15
-xDebug 2.6.1

### Build Images
`docker-compose build`

### Start Services & Detach Console: 
`docker-compose up -d` 

### Start PHP Bash Shell
`docker-compose exec php bash`

### Create Laravel Project in Current Directory
`composer create-project laravel/laravel .`

### Migrate Database
`php artisan:migrate`

### Stop Services
`docker-compose down`

### Force ReBuild Images
`docker-compose up --force-recreate`