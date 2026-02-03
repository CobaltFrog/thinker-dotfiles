#!/bin/bash

install_dir="~/.config"
backup_dir="~/.config/.config.back"

function copy_blacklist() {
    SOURCE_DIR="$1"
    TARGET_DIR="$2"
    BLACKLIST=(
        ".git"
        ".test"
    )

    cd "$SOURCE_DIR" || return 1

    for dir in */; do
        if [[ -d "$dir" ]]; then
            dir_name="${dir%/}"

            if [[ -d "$TARGET_DIR/$dir" ]]; then
                echo "Target directory ($dir_name) exists. Creating backup."
                mv_existed "$TARGET_DIR/$dir_name" "$backup_dir"
            fi

            for blacklisted in "${BLACKLIST[@]}"; do
                if [[ $dir_name == "$blacklisted" ]]; then
                    echo "Directory $dir_name is blacklisted. Skip."
                    break
                else
                    ln -sf "$(pwd)/$dir_name" "$TARGET_DIR" || return 1
                fi
            done
        else
            continue
        fi
    done

    # i have no idea how this works
    cd - >/dev/null

    return 0
}

function mv_existed() {
    FALLBACK_DIR="$(pwd)/.config.back" 

    T_DIR="$1"
    B_DIR="$2"

    if [[ -d "$T_DIR" ]]; then
        if [[ -d "$B_DIR" ]]; then
            echo "Found backup directory"   
        else
            echo "Creating fallback directory"
            mkdir $FALLBACK_DIR
            B_DIR="$FALLBACK_DIR"
        fi
        
        mv "$T_DIR" "$B_DIR"

        return 0
    fi

    return 22
}

while [ 1 ]; do
    read -p "Start installation? [y/n]: " -n 1 -r
    echo
    if [[ $REPLY = "n" ]]; then
        echo "Canceled installation."
        break
    elif [[ $REPLY = "y" ]]; then
        echo "Starting installation to $install_dir"
        copy_blacklist $(pwd) $install_dir
        break
    else
        echo "Unknown value. Try again."
    fi
done
