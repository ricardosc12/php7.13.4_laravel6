#!/bin/bash

cp -a /tmp_vendor_not_use /var/www/html/vendor

# Executa o comando composer dump-autoload
composer dump-autoload

# Inicia o servidor web
apache2-foreground