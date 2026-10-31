#!/bin/bash

active_info=$(nmcli -t -f DEVICE,TYPE,STATE device | grep ":connected$" | grep -v ":loopback:")

if [ -n "$active_info" ]; then
  active_device=$(echo "$active_info" | cut -d':' -f1 | head -n 1)
  active_connection=$(nmcli -t -f GENERAL.CONNECTION device show "$active_device" | cut -d':' -f2)

  echo "Connected to: $active_connection on device: $active_device"
else
  echo "Disconnected"
fi
