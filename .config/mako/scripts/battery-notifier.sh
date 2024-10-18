#!/bin/bash

# Функция для отправки уведомления
send_battery_notification() {
  level=$(acpi -b | grep -o '[0-9]*%')
  level=${level%\%}

  if ((level <= 5)); then
    notify-send -u critical "Battery" "Critical level: $level%" -i battery-caution
  elif ((level <= 10)); then
    notify-send -u critical "Battery" "Low level: $level%" -i battery-low
  elif ((level <= 15)); then
    notify-send -u normal "Battery" "Battery level: $level%" -i battery
  elif ((level <= 20)); then
    notify-send -u normal "Battery" "Battery level: $level%" -i battery
  elif ((level <= 25)); then
    notify-send -u normal "Battery" "Battery level: $level%" -i battery
  elif ((level <= 30)); then
    notify-send -u normal "Battery" "Battery level: $level%" -i battery
  fi
}

# Запуск цикла проверки уровня заряда
while true; do
  send_battery_notification
  sleep 300 # Проверять каждые 5 минут (300 секунд)
done
