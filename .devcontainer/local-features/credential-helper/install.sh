#!/usr/bin/env bash

set -eax

sudo -iu $_REMOTE_USER <<EOF
  rm /etc/gitconfig && ln -s /etc/diploi-git/gitconfig /etc/gitconfig
EOF