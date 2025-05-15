#!/bin/bash

# Detect if we are in an interactive shell
if [[ -t 1 && "$#" -eq 1 && "$1" == "bash" ]]; then
    echo "Switching to non-root user for interactive shell"
    exec su - codespace
fi

# Run CMD as root
exec "$@"