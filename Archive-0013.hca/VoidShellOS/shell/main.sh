#!/bin/bash
# main shell loop, kinda janky but works

echo "VoidShell Terminal v0.0.3b"
echo "type 'help' to list cmds."

while true; do
  echo -n "> "
  read cmd args

  if [ "$cmd" == "exit" ]; then
    echo "bye lol"
    break
  elif [ -x "./cmds/$cmd" ]; then
    ./cmds/$cmd $args
  else
    echo "$cmd: not found"
  fi
done
