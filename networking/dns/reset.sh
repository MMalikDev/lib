#!/bin/bash

set -e

# Icons
icon="\xE2\x8C\x9B" # Hourglass (U+231B)

source ./lib.sh
# ---------------------------------------------------------------------- #
# Define Project Variables
# ---------------------------------------------------------------------- #
declare -a images=(
    adguard/adguardhome
)

declare -a volumes=(
    adguard_data
    adguard_config
)

declare -a bindings=(
    volumes/
)

# ---------------------------------------------------------------------- #
# Main Function
# ---------------------------------------------------------------------- #
main(){
    # Shut down all containers
    docker compose down
    
    # Clean up
    run folders remove_folders  ${bindings[*]}
    run volumes remove_volumes  ${volumes[*]}
    run images  remove_images   ${images[*]}
    prune_docker
}

main $@
