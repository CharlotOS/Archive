#!/bin/bash
# boot script for VoidShellOS
clear
echo "[ voidshellOS 0.0.3b ]"
echo "Loading kernel modules..."
sleep 1
echo "Mounting /sys..."
sleep 1
cd shell
./main.sh
