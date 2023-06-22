#!/bin/bash

# set -e

# Icons
icon_log="\xF0\x9F\x93\x91" # Bookmark Tabs (U+1F4D1)
icon_start="\xF0\x9F\x9B\xA0 " # Hammer and Wrench (U+1F6E0)

# ---------------------------------------------------------------------- #
# Define Project Variables
# ---------------------------------------------------------------------- #
add_python(){
    cd src
    pip3 install -r requirements/core.txt
    pip3 freeze -l > requirements/versions.txt
    
}
add_javascript(){
    cd api
    npm install
}

add_svelte_libs(){
    setup(){
        printf "\n$icon_start Adding Svelte Libraries\n\n"
        cd $(get_env SVELTE_IMAGE)
        npm install -D svelte-add shadcn-svelte
        npx svelte-add@latest tailwindcss
        npx shadcn-svelte@latest init
        cd ..
    }
    run_svelte_locally(){
        printf "\n$icon_start Running Svelte using Node\n\n"
        cd $(get_env SVELTE_IMAGE)
        npm install
        npm run dev
        cd ..
    }
    
    run_locally(){
        setup
        run_svelte_locally
        exit 0
    }
}

# ---------------------------------------------------------------------- #
# Main Function
# ---------------------------------------------------------------------- #
main(){
    add_python
    add_javascript
}

# ---------------------------------------------------------------------- #
# Core Script
# ---------------------------------------------------------------------- #

main
