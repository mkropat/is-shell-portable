#!/bin/sh

main() {
    echo "cmd,exists"
    while read -r _main_cmd; do
        if [ -z "$_main_cmd" ]; then
            echo
        else
            printf '%s,%s\n' "$_main_cmd" "$(get_type "$_main_cmd")"
        fi
    done <cmds.txt
}

get_type() {
    _get_type_output=$(type "$1" 2>/dev/null)

    if [ $? -eq 0 ]; then
        case "$_get_type_output" in
            *builtin*|*keyword*) echo built-in ;;
            */*)                 echo command ;;
            *)                   echo yes ;;
        esac
    else
        echo no
    fi
}


main "$@"
