#!/bin/bash

CACHE_DIR="$HOME/.cache/thinker-scripts/swww/"

e_help() {
    echo "usage: $0 <option> [<dir>]"
    echo "options:"
    echo "  -help                   print this message"
    echo "  -destroy                remove all cache files in <$CACHE_DIR>"
    echo ""
    echo "  -wdirnext <dir>         switch to next subdirectory in <dir> (working dir)"
    echo "  -wdirprev <dir>         switch to previous subdirectory in <dir>"
    echo "  -wnext                  switch to next wallpaper in working directory"
    echo "  -wprev                  switch to previous wallpaper in working directory"
    echo "  -wrandom                switch to random wallpaper in working directory"
    echo "  -wload                  load cached wallpaper for cached working directory"
    echo ""
    echo "  -next <dir>             switch to next wallpaper in <dir>"
    echo "  -prev <dir>             switch to previous wallpaper in <dir>"
    echo "  -random <dir>           switch to random wallpaper and save its index"
    echo "  -load <dir>             load cached wallpaper for <dir>"
}

e_help_big() {
    e_help
    echo ""
    echo "description:"
    echo "  Working directory is the currently selected subdirectory (persisted in cache)."
    echo "  Use -wdirnext / -wdirprev to change it, then -wnext / -wprev to cycle wallpapers inside it."
    echo "  All wallpaper operations require swww daemon running."
    exit 0
}

get_directories_list() {
    find "$1" -maxdepth 1 -mindepth 1 -type d -not -name ".*" -prune -printf "%p\n" | sort -V
}

get_directories_count() {
    echo -n "$1" | grep -c '^'
}

set_dir_index() {
    local parent_dir="$1"
    local new_index="$2"
    local hash=$(echo -n "$parent_dir" | md5sum | cut -d' ' -f1)
    local state_file="$CACHE_DIR/dir_index_${hash}"
    mkdir -p "$CACHE_DIR"
    echo "$new_index" > "$state_file"
}

get_dir_index() {
    local parent_dir="$1"
    local hash=$(echo -n "$parent_dir" | md5sum | cut -d' ' -f1)
    local state_file="$CACHE_DIR/dir_index_${hash}"
    if [ -f "$state_file" ]; then
        local idx=$(cat "$state_file")
        if [[ "$idx" =~ ^[0-9]+$ ]]; then
            echo "$idx"
        else
            echo "-1"
        fi
    else
        echo "-1"
    fi
}

get_dir_by_idx() {
    local dir_list="$1"
    local idx="$2"
    echo "$dir_list" | sed -n "$((idx + 1))p"
}

swap_wdir() {
    local parent_dir="$1"
    local direction="$2"   

    if [ ! -d "$parent_dir" ]; then
        echo "Error: Directory '$parent_dir' not found." >&2
        exit 1
    fi

    local dir_list=$(get_directories_list "$parent_dir")
    local total=$(get_directories_count "$dir_list")

    if [ "$total" -eq 0 ]; then
        echo "Error: No subdirectories found in '$parent_dir'." >&2
        exit 1
    fi

    local current_idx=$(get_dir_index "$parent_dir")
    local new_idx=$(( (current_idx + direction + total) % total ))
    local selected=$(get_dir_by_idx "$dir_list" "$new_idx")

    if [ -z "$selected" ]; then
        echo "Error: Failed to get subdirectory at index $new_idx." >&2
        exit 1
    fi

    
    mkdir -p "$CACHE_DIR"
    set_working_dir "$selected"
    set_dir_index "$parent_dir" "$new_idx"

    echo "Working directory set to: $selected"
}

set_working_dir() {
    echo "$1" > "$CACHE_DIR/current_working_dir"
}

check_swww_daemon() {
    if ! pgrep -x "swww-daemon" >/dev/null; then
        echo "Error: swww daemon is not running." >&2
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
        -iname "*.webp" \) -printf "%p\n" | sort -V
}

get_files_count() {
    echo -n "$1" | grep -c '^'
}

get_file_idx() {
    local dir="$1"
    local hash=$(echo -n "$dir" | md5sum | cut -d' ' -f1)
    local state_file="$CACHE_DIR/img_index_${hash}"

    if [ -f "$state_file" ]; then
        local idx=$(cat "$state_file")
        if [[ "$idx" =~ ^[0-9]+$ ]]; then
            echo "$idx"
        else
            echo "-1"
        fi
    else
        echo "-1"
    fi
}

set_file_idx() {
    local dir="$1"
    local new_index="$2"
    local hash=$(echo -n "$dir" | md5sum | cut -d' ' -f1)
    local state_file="$CACHE_DIR/img_index_${hash}"

    mkdir -p "$CACHE_DIR"
    echo "$new_index" > "$state_file"
}

get_file_by_idx() {
    local file_list="$1"
    local idx="$2"
    echo "$file_list" | sed -n "$((idx + 1))p"
}

set_wallpaper() {
    local file="$1"
    swww img "$file" --transition-type random --transition-fps 75 --transition-step 255 --transition-duration 1
    echo "Wallpaper set to: $file"
}

swap_seq() {
    local dir="$1"
    local direction="$2"

    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' not found." >&2
        exit 1
    fi

    local file_list=$(get_file_list "$dir")
    local total=$(get_files_count "$file_list")

    if [ "$total" -eq 0 ]; then
        echo "Error: No image files found in '$dir'." >&2
        exit 1
    fi

    local current_idx=$(get_file_idx "$dir")
    local new_idx=$(( (current_idx + direction + total) % total ))
    local selected=$(get_file_by_idx "$file_list" "$new_idx")

    if [ -z "$selected" ]; then
        echo "Error: Failed to get file at index $new_idx." >&2
        exit 1
    fi

    check_swww_daemon
    set_wallpaper "$selected"
    set_file_idx "$dir" "$new_idx"
}

swap_random() {
    local dir="$1"

    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' not found." >&2
        exit 1
    fi

    local file_list=$(get_file_list "$dir")
    local total=$(get_files_count "$file_list")

    if [ "$total" -eq 0 ]; then
        echo "Error: No image files found in '$dir'." >&2
        exit 1
    fi

    local rand_idx=$(( RANDOM % total ))
    local selected=$(get_file_by_idx "$file_list" "$rand_idx")

    check_swww_daemon
    set_wallpaper "$selected"
    set_file_idx "$dir" "$rand_idx"
}

swap_2_idx() {
    local dir="$1"

    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' not found." >&2
        exit 1
    fi

    local file_list=$(get_file_list "$dir")
    local total=$(get_files_count "$file_list")

    if [ "$total" -eq 0 ]; then
        echo "Error: No image files found in '$dir'." >&2
        exit 1
    fi

    local cached_idx=$(get_file_idx "$dir")
    if [ "$cached_idx" -eq -1 ] || [ "$cached_idx" -ge "$total" ]; then
        echo "Warning: No valid cached index for '$dir', using first wallpaper." >&2
        cached_idx=0
    fi

    local selected=$(get_file_by_idx "$file_list" "$cached_idx")

    if [ -z "$selected" ]; then
        echo "Error: Failed to get file at index $cached_idx." >&2
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

# MAIN
if [ $# -eq 0 ]; then
    e_help
    exit 1
fi

case "$1" in
    -help)
        e_help_big
        ;;
    -destroy)
        purge_cache
        ;;
    -wdirnext)
        if [ $# -ne 2 ]; then
            echo "Error: -wdirnext requires a directory." >&2
            e_help
            exit 1
        fi
        swap_wdir "$2" "+1"
        swap_2_idx "$(cat "$CACHE_DIR/current_working_dir")"
        ;;
    -wdirprev)
        if [ $# -ne 2 ]; then
            echo "Error: -wdirprev requires a directory." >&2
            e_help
            exit 1
        fi
        swap_wdir "$2" "-1"
        swap_2_idx "$(cat "$CACHE_DIR/current_working_dir")"
        ;;
    -wnext)
        if [ ! -f "$CACHE_DIR/current_working_dir" ]; then
            echo "Error: No working directory selected. Use -wdirnext first." >&2
            exit 1
        fi
        WORKING_DIR=$(cat "$CACHE_DIR/current_working_dir")
        if [ ! -d "$WORKING_DIR" ]; then
            echo "Error: Working directory '$WORKING_DIR' no longer exists." >&2
            exit 1
        fi
        swap_seq "$WORKING_DIR" "+1"
        ;;
    -wprev)
        if [ ! -f "$CACHE_DIR/current_working_dir" ]; then
            echo "Error: No working directory selected. Use -wdirnext first." >&2
            exit 1
        fi
        WORKING_DIR=$(cat "$CACHE_DIR/current_working_dir")
        if [ ! -d "$WORKING_DIR" ]; then
            echo "Error: Working directory '$WORKING_DIR' no longer exists." >&2
            exit 1
        fi
        swap_seq "$WORKING_DIR" "-1"
        ;;
    -wrandom)
        if [ ! -f "$CACHE_DIR/current_working_dir" ]; then
            echo "Error: No working directory selected. Use -wdirnext first." >&2
            exit 1
        fi
        WORKING_DIR=$(cat "$CACHE_DIR/current_working_dir")
        if [ ! -d "$WORKING_DIR" ]; then
            echo "Error: Working directory '$WORKING_DIR' no longer exists." >&2
            exit 1
        fi
        swap_random "$WORKING_DIR"
        ;;
    -wload)
        if [ ! -f "$CACHE_DIR/current_working_dir" ]; then
            echo "Error: No working directory selected. Use -wdirnext first." >&2
            exit 1
        fi
        WORKING_DIR=$(cat "$CACHE_DIR/current_working_dir")
        if [ ! -d "$WORKING_DIR" ]; then
            echo "Error: Working directory '$WORKING_DIR' no longer exists." >&2
            exit 1
        fi
        swap_2_idx "$WORKING_DIR"
        ;;
    -next)
        if [ $# -ne 2 ]; then
            echo "Error: -next requires a directory." >&2
            e_help
            exit 1
        fi
        swap_seq "$2" "+1"
        ;;
    -prev)
        if [ $# -ne 2 ]; then
            echo "Error: -prev requires a directory." >&2
            e_help
            exit 1
        fi
        swap_seq "$2" "-1"
        ;;
    -random)
        if [ $# -ne 2 ]; then
            echo "Error: -random requires a directory." >&2
            e_help
            exit 1
        fi
        swap_random "$2"
        ;;
    -load)
        if [ $# -ne 2 ]; then
            echo "Error: -load requires a directory." >&2
            e_help
            exit 1
        fi
        swap_2_idx "$2"
        ;;
    *)
        echo "Unknown option: $1" >&2
        e_help
        exit 1
        ;;
esac
