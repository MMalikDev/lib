#!/bin/bash

set -e

# Icons
icon_log="\xF0\x9F\x93\x91" # Bookmark Tabs (U+1F4D1)
icon_start="\xF0\x9F\x9B\xA0 " # Hammer and Wrench (U+1F6E0)

source ./lib.sh
# ---------------------------------------------------------------------- #
# Define Project Variables
# ---------------------------------------------------------------------- #
declare -a reloads=(
    twingate_connector
)

declare -a logs=(
    twingate_connector
)

# ---------------------------------------------------------------------- #
# OPTIONS
# ---------------------------------------------------------------------- #
get_docker(){
    printf "$icon_start Updating Repository"
    sudo apt update && sudo apt upgrade -y
    
    printf "$icon_start Installing Docker"
    setup_apt
    install_latest
    
    printf "$icon_start Adding User to Docker group"
    add_user
    
    printf "$icon_log Confirm Installation"
    docker --version
    docker compose version
}
run_docker(){
    reload_services ${reloads[*]}
    handle_errors $?
    
    docker image prune -f
    follow_logs ${logs[*]}
    exit 0
}

# ---------------------------------------------------------------------- #
# Main Function
# ---------------------------------------------------------------------- #
main(){
    while getopts "grlh" OPTION; do
        case $OPTION in
            g) get_docker               ;;
            r) run_docker               ;;
            l) docker compose logs -f   ;;
            h) display_usage            ;;
            ?) display_usage            ;;
        esac
    done
    shift $((OPTIND -1))
    display_usage
}

main $@
