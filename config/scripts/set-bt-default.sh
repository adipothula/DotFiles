#!/bin/bash

# Get first active (RUNNING) Bluetooth sink
BT_SINK=$(pactl list short sinks | grep bluez_output | grep RUNNING | awk '{print $2}')

# Get the device name of the Bluetooth sink
BT_DEVICE_NAME=$(bluetoothctl info "$BT_SINK" | grep "Name" | awk -F 'Name' '{print $2}' | sed 's/^ *//')


if [ -n "$BT_SINK" ]; then
    pactl set-default-sink "$BT_SINK"
    dunstify -u low "Bluetooth Audio" "Switched to [$BT_SINK] $BT_DEVICE_NAME 🎧"
fi
