#!/usr/bin/env bash
RED_COLOR='\033[1;31m'
YELLOW_COLOR='\033[1;33m'
BLUE_COLOR='\033[0;34m'
CYAN_COLOR='\033[0;36m'
BOLD_WHITE_COLOR='\033[1;37m'
RESET_COLOR='\033[0m'

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

confirm "Create and start containers? [Y/n]" && docker-compose up -d || exit
echo
sleep 2
echo
confirm "Install sample data? [Y/n]" && docker-compose exec web install-sampledata || echo -e "Sample data was ${RED_COLOR}not${RESET_COLOR} saved, database has been kept clean."
echo
sleep 2
echo
confirm "Install Magento automatically? [Y/n]" && docker-compose exec web install-magento || echo -e "Magento was ${RED_COLOR}not${RESET_COLOR} configured, do it manually on: ${BLUE_COLOR}http://magento192.local/index.php/install${RESET_COLOR}."
docker-compose ps
sleep 1
echo
echo "Remainder: containers are run in detached mode, in the background, so later run 'docker-compose ps' to list your containers and './logs.sh' to see the logs."
echo
