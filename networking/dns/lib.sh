#!/bin/bash

# Icons
icon="\xE2\x8C\x9B" # Hourglass (U+231B)
icon_log="\xF0\x9F\x93\x91" # Bookmark Tabs (U+1F4D1)
icon_start="\xF0\x9F\x9B\xA0 " # Hammer and Wrench (U+1F6E0)

# ---------------------------------------------------------------------- #
# Run
# ---------------------------------------------------------------------- #
display_usage() {
    cat << EOF

Usage: $0 [OPTIONS]

Setup and run a new Adguard Home DNS server

    OPTIONS
     -g     Get Docker and configure requirements
     -r     Run Adguard using Docker
     -l     Follow compose logs
     -h     Display this help

EOF
    
    exit 1
}

# Generic
get_env(){
    echo $(grep -i "$@" .env | cut -d "=" -f 2)
}
get_bool(){
    local variable=$(get_env "$@" | tr '[A-Z]' '[a-z]')
    
    if [[ $variable =~ (1|true) ]]; then
        echo true
    else
        echo false
    fi
}
handle_errors(){
    if [[ $(get_bool KEEP_LOGS) == "true" ]]; then
        printf "\n$icon_log Keeping logs...\n\n"
        return
    fi
    if [[ $@ != 0 ]]; then
        printf "\n$icon_start Error encountered!\n\n"
        exit 1
    fi
    
    clear
    printf "\n$icon_log Cleared logs...\n\n"
}

# Docker
reload_services(){
    local services=$@
    if [[ -n $services ]]; then
        printf "\n$icon_start Reloading the following service(s): "
        printf "$services\n\n"
    else
        printf "\n$icon_start Reloading all services\n\n"
    fi
    
    docker compose up -d
    echo "$services" | xargs docker compose kill
    echo "$services" | xargs docker compose up --force-recreate --build -d
}
follow_logs(){
    local services=$@
    if [[ -n $services ]]; then
        printf "\n$icon_log Getting logs from the following service(s): "
        printf "$services\n\n"
    else
        printf "\n$icon_log Getting logs from all services\n\n"
    fi
    
    echo "$services" | xargs docker compose logs -f
}
cp_docker(){
    local container=$1
    local source=$2
    local target=$3
    
    local containerID=$(docker-compose ps -qa $container)
    docker cp $containerID:$source $target
}

# ---------------------------------------------------------------------- #
# Reset
# ---------------------------------------------------------------------- #
run(){
    local name=$1
    local func=$2
    local array=${@:3}
    
    if [[ -n "$array" ]]; then
        printf "\n$icon Removing the following $name: $array\n"
        $func $array
    else
        printf "\n$icon No $name were removed\n"
    fi
}

remove_folders(){
    rm -rf $@
}
remove_volumes(){
    docker volume rm $@
}
remove_images(){
    docker rmi $@
}

prune_docker(){
    printf "\n$icon Pruning Docker\n"
    echo y | docker system prune
}

# ---------------------------------------------------------------------- #
# Setup
# ---------------------------------------------------------------------- #
setup_apt(){
    local url="https://download.docker.com/linux/debian"
    local keyrings="/etc/apt/keyrings/docker.gpg"
    local official="$url/gpg"
    
    local architecture=$(dpkg --print-architecture)
    local version=$(. /etc/os-release && echo "$VERSION_CODENAME")
    
    # Add Docker's official GPG key:
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL $official | sudo gpg --dearmor -o $keyrings
    sudo chmod a+r $keyrings
    
    # Add the repository to APT sources:
    echo "deb [arch=$architecture signed-by=$keyrings] $url $version stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
}
install_latest(){
    sudo apt install -y docker-ce docker-ce-cli
    sudo apt install -y containerd.io docker-buildx-plugin docker-compose-plugin
}
add_user(){
    sudo usermod -aG docker $USER
    newgrp docker
}
