#!/bin/bash

choice=$(printf "  Lock\n  Kill User Session\n󰍛  Suspend\n󰑙  Reboot\n  Power Off" | rofi -dmenu)

if [[ $choice == "  Lock" ]];then
  hyprlock
elif [[ $choice == "  Kill User Session" ]];then
  pkill -KILL -u "$USER"
elif [[ $choice == "󰍛  Suspend" ]];then
  hyprlock
  systemctl suspend
elif [[ $choice == "󰑙  Reboot" ]];then
  systemctl reboot
elif [[ $choice == "  Power Off" ]];then
  systemctl poweroff
fi