#!/bin/bash

CACHE_DIR="$HOME/.cache/thinker-scripts/swww"

e_help() {
    echo "usage: $0 <option> [<wallpaper-dir>]"
    echo "options:"
    echo "  -help                   print this message"
    echo "  -next <dir>             switch to next wallpaper in directory"
    echo "  -prev <dir>             switch to previous wallpaper in directory"
    echo "  -random <dir>           switch to random wallpaper, and start from it's index"
    echo "  -load <dir>             switch to wallpaper cached for this directory"
    echo "  -destroy                remove all cache files in <$CACHE_DIR>"
    exit 0
}

check_swww_daemon() {
    if ! pgrep -x "swww-daemon" >/dev/null; then
        echo "Error: swww daemon is not running."
        exit 1
    fi
}

get_file_list() {
    find "$1" -maxdepth 1 -type f \( \
        -iname "*.jpg" -o \
        -iname "*.jpeg" -o \
        -iname "*.png" -o \
        -iname "*.bmp" -o \
        -iname "*.gif" -o \
        -iname "*.tiff" -o \
        -iname "*.webp" \) -printf "%p\0" | sort -zV | tr '\0' '\n'
}

count_lines() {
    echo -n "$1" | grep -c '^'
}

read_index() {
    local dir="$1"
    local hash=$(echo -n "$dir" | md5sum | cut -d' ' -f1)
    local state_file="$CACHE_DIR/index_${hash}"

    if [ -f "$state_file" ]; then
        local idx=$(cat "$state_file")
        if [[ "$idx" =~ ^[0-9]+$ ]]; then
            echo "$idx"
        else
            echo "-1" # file is bad: does not contains index. starting over
        fi
    else
        echo "-1"
    fi
}

write_index() {
    local dir="$1"
    local new_index="$2"
    local hash=$(echo -n "$dir" | md5sum | cut -d' ' -f1)
    local state_file="$CACHE_DIR/index_${hash}"

    mkdir -p "$CACHE_DIR"
    echo "$new_index" > "$state_file"
}

get_file_by_index() {
    local file_list="$1"
    local idx="$2"
    echo "$file_list" | sed -n "$((idx + 1))p"
}

set_wallpaper() {
    local file="$1"
    swww img "$file" --transition-type random --transition-fps 75 --transition-step 255 --transition-duration 1
    echo "Wallpaper set to: $file"
}

change_sequential() {
    local dir="$1"
    local direction="$2" # (direction = +1 or -1)

    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' not found."
        exit 1
    fi

    local file_list=$(get_file_list "$dir")
    local total=$(count_lines "$file_list")

    if [ "$total" -eq 0 ]; then
        echo "Error: No image files found in '$dir'."
        exit 1
    fi

    local current_idx=$(read_index "$dir")
    local new_idx=$(( (current_idx + direction + total) % total ))
    local selected=$(get_file_by_index "$file_list" "$new_idx")

    if [ -z "$selected" ]; then
        echo "Error: Failed to get file at index $new_idx."
        exit 1
    fi

    check_swww_daemon
    set_wallpaper "$selected"
    write_index "$dir" "$new_idx"
}

change_random() {
    local dir="$1"

    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' not found."
        exit 1
    fi

    local file_list=$(get_file_list "$dir")
    local total=$(count_lines "$file_list")

    if [ "$total" -eq 0 ]; then
        echo "Error: No image files found in '$dir'."
        exit 1
    fi

    local rand_idx=$(( RANDOM % total ))
    local selected=$(get_file_by_index "$file_list" "$rand_idx")

    check_swww_daemon
    set_wallpaper "$selected"
    write_index "$dir" "$rand_idx" # 
}

load_dir_index() {
    local dir="$1"

    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' not found."
        exit 1
    fi

    local file_list=$(get_file_list "$dir")
    local total=$(count_lines "$file_list")

    if [ "$total" -eq 0 ]; then
        echo "Error: No image files found in '$dir'."
        exit 1
    fi

    local cached_idx=$(read_index "$dir")
    local selected=$(get_file_by_index "$file_list" "$cached_idx")

    if [ -z "$selected" ]; then
        echo "Error: Failed to get file at index $new_idx."
        exit 1
    fi

    check_swww_daemon
    set_wallpaper "$selected"
}

purge_cache() {
    if [ -d "$CACHE_DIR" ]; then
        rm -rf "$CACHE_DIR"
        echo "Cache directory $CACHE_DIR removed."
    else
        echo "Cache directory $CACHE_DIR does not exist."
    fi
}

if [ $# -eq 0 ]; then
    e_help
fi

case "$1" in
    -help) e_help ;;
    -destroy) purge_cache ;;
    -next)
        if [ $# -ne 2 ]; then
            echo "Error: requires a directory."
            e_help
        fi
        change_sequential "$2" "+1"
        ;;
    -prev)
        if [ $# -ne 2 ]; then
            echo "Error: requires a directory."
            e_help
        fi
        change_sequential "$2" "-1"
        ;;
    -random)
        if [ $# -ne 2 ]; then
            echo "Error: requires a directory."
            e_help
        fi
        change_random "$2"
        ;;
    -load)
        if [ $# -ne 2 ]; then
            echo "Error: requires a directory"
            e_help
        fi
        load_dir_index "$2"
        ;;
    *)
        echo "Unknown option: $1"
        e_help
        ;;
esac
