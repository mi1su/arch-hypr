#!/bin/bash

# Инициализация переменной для хранения последнего уровня
last_level=""

# Установка необходимых переменных окружения
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]]; then
  export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
fi

# Функция для отправки уведомления
send_battery_notification() {
    # Запись в лог-файл
    echo "$(date): Checking battery level" >> /tmp/battery_notifier.log

  level=$(acpi -b | grep -o '[0-9]*%')
  level=${level%\%}

  # Проверяем, разряжается ли батарея
  if [[ -z "$last_level" || $level -lt $last_level ]]; then
    # Уведомления при достижении определенных уровней
    if ((level <= 5)); then
      notify-send -u critical "Battery" "󰂃Critical level: $level%" -i battery-caution
    elif ((level <= 10)); then
      notify-send -u critical "Battery" "󰂃Low level: $level%" -i battery-low
    elif ((level <= 15 && last_level > 15)); then
      notify-send -u critical "Battery" "󰂃Low level: $level%" -i battery
    elif ((level <= 20 && last_level > 20)); then
      notify-send -u normal "Battery" "󰂃Battery level: $level%" -i battery
    elif ((level <= 25 && last_level > 25)); then
      notify-send -u normal "Battery" "󰂃Battery level: $level%" -i battery
    elif ((level <= 30 && last_level > 30)); then
      notify-send -u normal "Battery" "󰂃Battery level: $level%" -i battery
    fi
  fi

  # Обновляем последний уровень
  last_level=$level
}

# Запуск цикла проверки уровня заряда
while true; do
  send_battery_notification
  sleep 30 # Проверять каждые (30 секунд)
done
