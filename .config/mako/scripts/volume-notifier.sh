#!/bin/bash

# Установка переменной окружения XDG_RUNTIME_DIR, если она не определена
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

# Функция для отправки уведомления о громкости
send_volume_notification() {
  muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
  level=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')

  if [[ "$muted" == "yes" ]]; then
    notify-send -a "Volume Notifier" "Volume" " Muted - Level: $level%" -i audio-volume-muted
  else
    notify-send -a "Volume Notifier" "Volume" " Level: $level%" -i audio-volume-high
  fi
}

# Функция для отправки уведомления о микрофоне
send_mic_notification() {
  mic_muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
  mic_level=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk '{print $5}' | sed 's/%//')

  if [[ "$mic_muted" == "yes" ]]; then
    notify-send -a "Volume Notifier" "Microphone" " Muted - Level: $mic_level%" -i audio-input-microphone-muted
  else
    notify-send -a "Volume Notifier" "Microphone" " Level: $mic_level%" -i audio-input-microphone
  fi
}

# Инициализация переменных для хранения предыдущих значений
prev_muted=""
prev_level=""
prev_mic_muted=""
prev_mic_level=""

# Подписка на изменения в PulseAudio
pactl subscribe | while read -r line; do
  if echo "$line" | grep -q "sink"; then
    # Получаем текущее состояние звука и уровень громкости
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    level=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')

    # Проверяем, изменилось ли состояние звука или уровень громкости
    if [[ "$muted" != "$prev_muted" || "$level" != "$prev_level" ]]; then
      send_volume_notification
      prev_muted="$muted"
      prev_level="$level"
    fi
  fi

  if echo "$line" | grep -q "source"; then
    # Получаем текущее состояние микрофона и уровень громкости
    mic_muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
    mic_level=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk '{print $5}' | sed 's/%//')

    # Проверяем, изменилось ли состояние микрофона или уровень громкости
    if [[ "$mic_muted" != "$prev_mic_muted" || "$mic_level" != "$prev_mic_level" ]]; then
      send_mic_notification
      prev_mic_muted="$mic_muted"
      prev_mic_level="$mic_level"
    fi
  fi
done
