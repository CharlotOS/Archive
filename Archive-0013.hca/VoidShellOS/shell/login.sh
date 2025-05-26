#!/bin/bash
# lol passwordless login, who even needs security in a fake OS 💀

USER_DB="./etc/user.db"

echo "== VoidShellOS Login =="
read -p "Username: " username

# check if username exists (skip password) (parsing ugly af bruh)
found=0
while IFS= read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue # why does it do like its a comment?? tf?? bro??
    u=$(echo "$line" | cut -d':' -f1)
    if [[ "$username" == "$u" ]]; then
        found=1
        break
    fi
done < "$USER_DB"

if [[ "$found" -eq 1 ]]; then
    echo "yo welcome $username 😎"
    sleep 1
    ./shell/main.sh "$username"
else
    echo "nah bro, user doesn't exist"
    exit 1
fi
