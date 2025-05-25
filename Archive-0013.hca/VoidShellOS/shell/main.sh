#!/bin/bash
# voidshell main shell
# kinda legit terminal, use at own risk 😎

CMD_DIR="./shell/cmds"

function run_shell {
    clear
    cat ./etc/motd
    while true; do
        echo -n "[void@vshell ~]$ "
        read input

        cmd=$(echo "$input" | awk '{print $1}')
        args=$(echo "$input" | cut -d' ' -f2-)

        if [[ "$cmd" == "exit" ]]; then
            echo "bye nerd 🫡"
            break
        elif [[ -f "$CMD_DIR/$cmd" && -x "$CMD_DIR/$cmd" ]]; then
            "$CMD_DIR/$cmd" $args
        elif [[ "$cmd" == "cd" ]]; then
            cd "$args" 2>/dev/null || echo "nah that dir don't exist"
        elif [[ "$cmd" == "ls" ]]; then
            ls -p --color=auto
        elif [[ "$cmd" == "pwd" ]]; then
            pwd
        elif [[ "$cmd" == "clear" ]]; then
            clear
        else
            echo "command '$cmd' not found 💀"
        fi
    done
}

run_shell
