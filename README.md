# php7.13.4_laravel6

The solution for optimization is:

If you are using it on Windows, in development mode there is nothing to do, but if you disable volume mapping in docker-compose it will drastically reduce the times

An effective solution is to use it within WSL, that is, the files/repository within it, remembering:

#### chmod -R 777 php7.13.4_laravel6/

#### docker compose up -d


