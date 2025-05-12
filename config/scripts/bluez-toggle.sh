#!/bin/bash

# Check if blueman-manager is running
if pgrep -x "blueman-manager" > /dev/null; then
  # Bring blueman-manager to the front if it's running
  wmctrl -a "Blueman Manager" || blueman-manager &
else
  # Start blueman-manager if it's not running
  blueman-manager &
fi

# Ensure blueman-applet is running only once
if ! pgrep -x "blueman-applet" > /dev/null; then
  blueman-applet &
fi