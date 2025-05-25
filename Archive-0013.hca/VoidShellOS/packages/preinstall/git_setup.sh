#!/bin/bash
# lol idk who didn't include git by default but fixin that mess now
# also pre-sets user cuz we lazy

# check if already installed
if command -v git >/dev/null 2>&1; then
    echo "git already here. chillin 🧊"
    exit 0
fi

# install git
echo "[+] installing git... (hopefully net works lol)"
apt-get update && apt-get install -y git

# config (bruh default user, deal w it)
git config --global user.name "voidshell_user"
git config --global user.email "void@void.local"

echo "[+] git ready to roll"
