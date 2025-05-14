#!/usr/bin/env bash

set -eax

RUN apt-get update \
  && apt-get -y supervisor

cat > /etc/supervisord.conf <<EOT
[supervisord]
nodaemon=true
user=root
logfile=/dev/null
logfile_maxbytes=0
pidfile=/var/run/supervisord.pid

[unix_http_server]
file=/var/run/supervisor.sock

[supervisorctl]
serverurl=unix:///var/run/supervisor.sock

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[program:code-server]
directory=/app
user=codespace
environment=HOME="/home/codespace"
command=/usr/local/bin/code-server-entrypoint
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
EOT