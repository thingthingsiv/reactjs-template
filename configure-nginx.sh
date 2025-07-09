#!/bin/bash

SERVICE_NAME=$1
SERVICE_PORT=$2

CONF_PATH="/etc/nginx/sites-available/${SERVICE_NAME}.conf"

# Generate reverse proxy config
cat <<EOF | sudo /usr/bin/tee $CONF_PATH
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

sudo ln -sf $CONF_PATH /etc/nginx/sites-enabled/
sudo /usr/sbin/nginx -t
sudo /bin/systemctl reload nginx
