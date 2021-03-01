[Unit]
Description=Ghost
After=network.target

[Service]
Type=simple

WorkingDirectory=/var/www/ghost
User=ghost
Group=ghost


Environment=NODE_ENV=production

ExecStart=/usr/bin/yarn start --production
ExecStop=/usr/bin/yarn stop --production
Restart=always
SyslogIdentifier=Ghost

[Install]
WantedBy=multi-user.target
