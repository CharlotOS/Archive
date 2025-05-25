#!/bin/bash
# lol yeah this one finally "secure" now
# not that anyone gonna use this irl 💀

USER_DB="./etc/user.db"

echo "== VoidShellOS Login =="
read -p "Username: " username
read -s -p "Password: " password
echo ""

# hash pass
pass_hash=$(echo -n "$password" | sha256sum | awk '{print $1}')

# bruh this parsing ugly af
found=0
while IFS= read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue
    u=$(echo "$line" | cut -d':' -f1)
    h=$(echo "$line" | cut -d':' -f2)
    if [[ "$username" == "$u" && "$pass_hash" == "$h" ]]; then
        found=1
        break
    fi
done < "$USER_DB"

if [[ "$found" -eq 1 ]]; then
    echo "yo welcome $username 😎"
    sleep 1
    ./shell/main.sh "$username"
else
    echo "nah wrong creds, try again"
    exit 1
fi
