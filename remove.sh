#!/usr/bin/env bash
docker-compose images

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

echo    '--------------------------------'
confirm "Stop containers and remove them? [y/N]" && docker-compose down || echo "Nothing was done."
