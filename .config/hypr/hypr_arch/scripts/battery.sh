#!/bin/bash
# Получаем уровень заряда батареи
battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
echo "Battery: $battery_level%"

