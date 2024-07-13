#!/bin/bash

openssl req -nodes -x509 -newkey rsa:2048 -keyout cert.key -out cert.csr -subj "/C=MO/ST=dar/L=1337/O=ostora/CN=dali3.com"

echo "server {\n    listen 443 ssl;\n    server_name inception;\n    ssl_certificate /etc/nginx/certs/cert.csr;\n    ssl_certificate_key /etc/nginx/certs/cert.key;\n    ssl_protocols TLSv1.2 TLSv1.3;\n\n    root /var/www/html;\n    index index.php;\n    location ~ [^/]\.php(/|$) { \n        try_files \$uri =404;\n        fastcgi_pass wordpress:9000;\n        include fastcgi_params;\n        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;\n    }\n}" >> /etc/nginx/conf.d/nginx.conf


nginx -g "daemon off;"
