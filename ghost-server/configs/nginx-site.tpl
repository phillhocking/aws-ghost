server {
    listen 0.0.0.0:80;
    server_name ${domain-name};
    access_log /var/log/nginx/${domain-name}-access.log;

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header HOST \$http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_set_header X-Forwarded-Proto https;
        proxy_buffering off;
        proxy_pass http://localhost:2368;
        proxy_redirect off;
    }

    location = /health {
      return 200;
      #access_log off;
    }
}