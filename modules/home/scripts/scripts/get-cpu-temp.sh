#!/usr/bin/env bash

TEMP_LABEL="Package id 0:"

# Get the temperature using lm_sensors
CPU_TEMP_RAW=$(sensors | grep "$TEMP_LABEL" | awk '{print $4}' | sed 's/+//' | sed 's/°C//')

# Check if we got a number. If not, output N/A or an error message.
if [[ -z "$CPU_TEMP_RAW" || ! "$CPU_TEMP_RAW" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "N/A" # or {"text": "N/A", "class": "error"} if return-type is json
  exit 1
fi

# Convert to integer (optional, for cleaner display)
CPU_TEMP=$(printf "%.0f" "$CPU_TEMP_RAW")

TEMP_CLASS=""
if ((CPU_TEMP > 85)); then
  TEMP_CLASS="critical"
elif ((CPU_TEMP > 70)); then
  TEMP_CLASS="warning"
else
  TEMP_CLASS="ok"
fi

# Output in JSON format for Waybar (best for classes/tooltips)
cat <<EOF
{
  "text": "${CPU_TEMP}",
  "tooltip": "CPU Temperature: ${CPU_TEMP_RAW}°C",
  "class": "${TEMP_CLASS}"
}
EOF
