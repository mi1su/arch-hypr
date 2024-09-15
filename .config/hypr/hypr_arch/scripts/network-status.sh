#!/bin/bash
# Получаем статус всех устройств
connection_status=$(nmcli -t -f STATE device | grep -v '^disconnected')

if [ -n "$connection_status" ]; then
    # Получаем имя активного соединения
    active_connection=$(nmcli -t -f NAME,DEVICE,STATE connection show --active | grep 'connected' | cut -d':' -f1)
    active_device=$(nmcli -t -f DEVICE,STATE device | grep 'connected' | cut -d':' -f1)

    echo "Connected to: $active_connection on device: $active_device"
else
    echo "Disconnected"
fi

