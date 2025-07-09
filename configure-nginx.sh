#!/bin/bash

SERVICE_NAME=$1
SERVICE_PORT=$2

cat <<EOF | sudo tee /etc/nginx/sites-available/${SERVICE_NAME}.conf
server {
    listen 80;
    server_name ${SERVICE_NAME}.sivthingthing.xyz;

    location / {
        proxy_pass http://localhost:${SERVICE_PORT};
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

sudo ln -sf /etc/nginx/sites-available/${SERVICE_NAME}.conf /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
