#!/bin/env bash

dir="${1:-.}"

if [[ ! -d "$dir" ]]; then
    echo "Ошибка: '$dir' не является директорией" >&2
    return 1
fi

file
base
output_name
for file in "$dir"/*; do
    [[ -f "$file" ]] || continue
    [[ "$file" == *.lua ]] && continue

    base="${file##*/}"

    # Если заканчивается на .conf — убираем его, иначе оставляем как есть
    if [[ "$base" == *.conf ]]; then
        output_name="${base%.conf}.lua"
    else
        output_name="${base}.lua"
    fi

    echo "Обрабатываю: $file -> ${file%/*}/$output_name"
    PYTHONPATH=/home/cfrog/repos/hyprconf2lua/src python3 -m hyprconf2lua \
        -o "${file%/*}/$output_name" "$file"

    if [[ $? -ne 0 ]]; then
        echo "Ошибка при обработке файла: $file" >&2
    fi
done
