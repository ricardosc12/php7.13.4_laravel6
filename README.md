# php7.13.4_laravel6

The solution for optimization is:

If you are using it on Windows, in development mode there is nothing to do, but if you disable volume mapping in docker-compose it will drastically reduce the times

An effective solution is to use it within WSL, that is, the files/repository within it, remembering:

#### chmod -R 777 php7.13.4_laravel6/

#### docker compose up -d


https://stackoverflow.com/questions/78156282/how-to-optimize-php-7-3-14-laravel-6/78156562#78156562

https://learn.microsoft.com/en-us/windows/wsl/filesystems#file-storage-and-performance-across-file-systems
