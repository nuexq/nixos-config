#!/usr/bin/env bash

TEMP_LABEL="Package id 0:"

# Get the temperature using lm_sensors
CPU_TEMP_RAW=$(sensors | grep "$TEMP_LABEL" | awk '{print $4}' | sed 's/+//' | sed 's/°C//')

# Convert to integer (optional, for cleaner display)
CPU_TEMP=$(printf "%.0f" "$CPU_TEMP_RAW")

TEMP_CLASS=""
if ((CPU_TEMP > 85)); then
  TEMP_CLASS="crit"
elif ((CPU_TEMP > 70)); then
  TEMP_CLASS="warn"
else
  TEMP_CLASS="ok"
fi

# Set the icon
TEMP_ICON=""
if ((CPU_TEMP > 85)); then
  TEMP_ICON=""
elif ((CPU_TEMP > 70)); then
  TEMP_ICON=""
else
  TEMP_ICON=""
fi

# Output in JSON format for Waybar
echo "{\"text\":\"$TEMP_ICON $CPU_TEMP\", \"class\":\"$TEMP_CLASS\"}"
