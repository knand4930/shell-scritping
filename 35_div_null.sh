#!/bin/bin

#!/bin/bash

read -p "Which site do you want to check: " site

# Ping the site once quietly
ping -c 1 -q "$site" >/dev/null 2>&1
ping_status=$?

if [[ $ping_status -eq 0 ]]; then
    echo "Site $site is reachable."
    exit 0
else
    echo "Site $site is not reachable."
    exit 1
fi
