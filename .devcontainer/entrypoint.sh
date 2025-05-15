#!/bin/bash

# Check if this is the default command
if [[ "$0" == "/entrypoint.sh" && "$1" == "supervisord" ]]; then
    # Run CMD as root
    exec "$@"
else
    # If exec'd into the container or a custom command is run, drop to non-root
    exec su - codespace -c "$*"
fi