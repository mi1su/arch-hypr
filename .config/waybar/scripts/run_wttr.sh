#!/bin/bash
source $HOME/.config/waybar/scripts/.venv/bin/activate
exec python3 $HOME/.config/waybar/scripts/wttr.py
