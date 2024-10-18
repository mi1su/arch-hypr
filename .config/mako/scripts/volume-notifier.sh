#!/bin/bash

# Функция для отправки уведомления
send_notification() {
  muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

  if [[ "$muted" == "yes" ]]; then
    notify-send -a "Volume Notifier" "Volume" " Muted" -i audio-volume-muted
  else
    level=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')
    notify-send -a "Volume Notifier" "Volume" "  Level: $level%" -i audio-volume-high
  fi
}

# Подписка на изменения в PulseAudio
pactl subscribe | while read -r line; do
  if echo "$line" | grep -q "sink"; then
    send_notification
  fi
done
