#!/bin/bash
# main.sh - the main shell loop of VoidShellOS
# yo so this is where u spend most of ur time after logging in
# commands run here, we got some builtin stuff and external cmds
# dont @ me for the mess, we just keepin it real & casual
# pro tip: try 'help' if u r lost lol

USER="$1"
CMD_DIR="./shell/cmds"

# gotta set a default dir on login
cd ~ 2>/dev/null || cd /

# main shell loop
while true; do
    # print prompt with username & current dir (like a pro)
    echo -n "[$USER@voidshell $(pwd)]$ "
    read -r input

    # trim leading/trailing spaces (lol no fancy stuff)
    input=$(echo "$input" | sed 's/^[ \t]*//;s/[ \t]*$//')

    # skip empty input
    [[ -z "$input" ]] && continue

    # parse command and args
    cmd=$(echo "$input" | awk '{print $1}')
    args=$(echo "$input" | cut -d' ' -f2-)

    # builtin commands
    case "$cmd" in
        exit)
            echo "peace out homie ✌️"
            break
            ;;
        cd)
            if [[ -z "$args" ]]; then
                cd ~ 2>/dev/null || echo "nah, no home dir found"
            else
                cd "$args" 2>/dev/null || echo "nah, '$args' ain't a thing"
            fi
            ;;
        pwd)
            pwd
            ;;
        ls)
            # lol basic ls with colors, no fancy flags yet
            ls -p --color=auto "$args" 2>/dev/null || echo "ls fail bro"
            ;;
        clear)
            clear
            ;;
        help)
            echo "VoidShell commands:"
            echo "  cd [dir]    - change directory"
            echo "  ls [args]   - list files"
            echo "  pwd         - print current dir"
            echo "  clear       - clear screen"
            echo "  exit        - logout"
            echo "  vsearch     - search the web (duckduckgo)"
            echo "  uplink      - check net connectivity"
            echo "  voidscan    - system info"
            echo "  cat [file]  - show file contents"
            echo "  touch [file]- create empty file"
            echo "  sudo [cmd]  - run commands with 'fake' root"
            ;;
        sudo)
            # lol fake sudo, no real perms but fun
            if [[ -z "$args" ]]; then
                echo "yo sudo what? need a command"
            else
                echo "sudo: permission denied (but keep dreaming)"
            fi
            ;;
        *)
            # try to run external commands from ./shell/cmds/
            if [[ -x "$CMD_DIR/$cmd" ]]; then
                "$CMD_DIR/$cmd" $args
            else
                echo "wtf is '$cmd'? try 'help' or somethin"
            fi
            ;;
    esac
done

# shell ended, peace
echo "voidshell session ended. cya later."
