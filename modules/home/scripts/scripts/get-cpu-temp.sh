#!/usr/bin/env bash

CPU_TEMP_RAW=$(sensors | grep -E "Tctl:|Package id 0:" | head -n 1 | awk '{print $2 ? $2 : $4}' | tr -d '+°C')

if [ -z "$CPU_TEMP_RAW" ]; then
    CPU_TEMP_RAW=$(sensors | grep -i "temp1\|core" | head -n 1 | awk '{print $2}' | tr -d '+°C')
fi

CPU_TEMP=$(printf "%.0f" "$CPU_TEMP_RAW" 2>/dev/null)

if [ -z "$CPU_TEMP" ]; then
    CPU_TEMP=0
fi

TEMP_CLASS="ok"
((CPU_TEMP > 70)) && TEMP_CLASS="warn"
((CPU_TEMP > 85)) && TEMP_CLASS="crit"

TEMP_ICON=""
((CPU_TEMP > 70)) && TEMP_ICON=""
((CPU_TEMP > 85)) && TEMP_ICON=""

echo "{\"text\":\"$TEMP_ICON ${CPU_TEMP}°C\", \"class\":\"$TEMP_CLASS\"}"
