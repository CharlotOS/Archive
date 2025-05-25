#!/bin/bash
# init.sh - VoidShellOS boot sequence
# yo this is where it all starts, no bloat, just straightup launchin login
# ngl this script is kinda barebones but it does the job lol

clear
echo "🔥 Booting VoidShellOS..."
sleep 1

# check if essential dirs/files exist (just in case)
if [ ! -d "./shell" ]; then
    echo "wtf? missing shell dir, u dun goofed"
    exit 1
fi

if [ ! -f "./shell/login.sh" ]; then
    echo "bruh login script not found, can't boot"
    exit 1
fi

if [ ! -f "./etc/user.db" ]; then
    echo "no user database? u serious?"
    exit 1
fi

# all good, launch login screen, hands off from here
./shell/login.sh
