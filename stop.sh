#!/usr/bin/env bash
docker-compose ps

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

echo    '--------------------------------------'
confirm "Stop containers without deleting them? [y/N]" && docker-compose stop || echo "Nothing was done."
