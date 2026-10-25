#!/usr/bin/env bash

TMP_RAW_MKV="/tmp/recording_raw.mkv"
TMP_MP4_FILE="/tmp/recording.mp4"
TMP_PALETTE_FILE="/tmp/palette.png"
TMP_FILE_UNOPTIMIZED="/tmp/recording_unoptimized.gif"
TMP_GIF_RESULT="/tmp/gif_result"
STATE_FILE="/tmp/recording_profile"
APP_NAME="Recorder"

# Saves directly into ~/Videos/Recordings
OUT_DIR="$HOME/Videos/Recordings"
mkdir -p "$OUT_DIR"

AUDIO_DEV="$(pactl get-default-sink).monitor"

notify() {
  notify-send -a "$APP_NAME" "$1" "$2" -t 4000
}

is_recorder_running() {
  pgrep -x wl-screenrec >/dev/null
}

convert_to_gif() {
  ffmpeg -y -i "$TMP_RAW_MKV" -filter_complex "[0:v] palettegen" "$TMP_PALETTE_FILE"
  ffmpeg -y -i "$TMP_RAW_MKV" -i "$TMP_PALETTE_FILE" -filter_complex "[0:v] fps=20,scale=1200:-1:flags=lanczos [new];[new][1:v] paletteuse" "$TMP_FILE_UNOPTIMIZED"
  rm -f "$TMP_PALETTE_FILE" "$TMP_RAW_MKV"
  gifsicle -O3 --lossy=80 -i "$TMP_FILE_UNOPTIMIZED" -o "$TMP_GIF_RESULT"
  rm -f "$TMP_FILE_UNOPTIMIZED"
}

process_mp4() {
  local profile="$1"
  if [[ "$profile" == "showcase" ]]; then
    ffmpeg -y -fflags +genpts -i "$TMP_RAW_MKV" -c:v libx264 -crf 23 -preset veryfast -pix_fmt yuv420p -c:a aac -b:a 128k -movflags +faststart -fps_mode cfr "$TMP_MP4_FILE"
  else
    # Remuxes .mkv -> .mp4 in <0.1s while fixing any duplicate DTS timestamps
    ffmpeg -y -fflags +genpts -i "$TMP_RAW_MKV" -c:v copy -c:a aac -b:a 160k -movflags +faststart "$TMP_MP4_FILE"
  fi
  rm -f "$TMP_RAW_MKV"
}

stop() {
  if is_recorder_running; then
    pkill -SIGINT -x wl-screenrec
    while is_recorder_running; do sleep 0.1; done

    PROFILE="showcase"
    [[ -f "$STATE_FILE" ]] && PROFILE=$(cat "$STATE_FILE")
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

    if [[ "$PROFILE" == "gif" ]]; then
      notify "Stopped Recording" "Converting to optimized GIF..."
      SavePath="$OUT_DIR/gif_${TIMESTAMP}.gif"
      convert_to_gif
      mv "$TMP_GIF_RESULT" "$SavePath"
      wl-copy -t image/gif <"$SavePath"
      SIZE=$(du -h "$SavePath" | cut -f1)
      notify "GIF Saved ($SIZE)" "Saved to $SavePath & copied to clipboard"
    else
      if [[ "$PROFILE" == "showcase" ]]; then
        notify "Stopped Recording" "Compressing desktop showcase..."
      else
        notify "Stopped Recording" "Saving $PROFILE recording..."
      fi
      SavePath="$OUT_DIR/${PROFILE}_${TIMESTAMP}.mp4"
      process_mp4 "$PROFILE"
      mv "$TMP_MP4_FILE" "$SavePath"
      wl-copy -t video/mp4 <"$SavePath"
      SIZE=$(du -h "$SavePath" | cut -f1)
      notify "Video Saved ($SIZE)" "Saved to $SavePath & copied to clipboard"
    fi

    rm -f "$TMP_FILE_UNOPTIMIZED" "$TMP_PALETTE_FILE" "$TMP_GIF_RESULT" "$TMP_RAW_MKV" "$TMP_MP4_FILE" "$STATE_FILE"
    exit 0
  fi
}

# If already recording, any call to `record` stops and saves it
if is_recorder_running; then
  stop
fi

MODE="${1:-screen}"
PROFILE="${2:-showcase}"

# Clean up any leftover temp files before starting
rm -f "$TMP_FILE_UNOPTIMIZED" "$TMP_PALETTE_FILE" "$TMP_GIF_RESULT" "$TMP_RAW_MKV" "$TMP_MP4_FILE" "$STATE_FILE"

# Configure wl-screenrec parameters per profile
case "$PROFILE" in
game)
  REC_ARGS=(--low-power off --audio --audio-device "$AUDIO_DEV" --codec avc -b "12 Mb" -m 60)
  ;;
clip)
  REC_ARGS=(--low-power off --audio --audio-device "$AUDIO_DEV" --codec avc -b "2.5 Mb" -m 60)
  ;;
showcase | *)
  PROFILE="showcase"
  REC_ARGS=(--low-power off --audio --audio-device "$AUDIO_DEV" --codec avc -b "8 Mb" -m 60)
  ;;
esac

case "$MODE" in
screen)
  echo "$PROFILE" >"$STATE_FILE"
  notify "Recording Started [$PROFILE]" "Full screen + desktop audio"
  timeout 600 wl-screenrec "${REC_ARGS[@]}" -f "$TMP_RAW_MKV"
  ;;
area)
  GEOMETRY=$(slurp)
  if [[ -n "$GEOMETRY" ]]; then
    echo "$PROFILE" >"$STATE_FILE"
    notify "Recording Started [$PROFILE]" "Selected area + desktop audio"
    timeout 600 wl-screenrec "${REC_ARGS[@]}" -g "$GEOMETRY" -f "$TMP_RAW_MKV"
  fi
  ;;
gif)
  GEOMETRY=$(slurp)
  if [[ -n "$GEOMETRY" ]]; then
    echo "gif" >"$STATE_FILE"
    notify "Recording Started [gif]" "Selected area (muted)"
    timeout 600 wl-screenrec --codec avc -m 30 -g "$GEOMETRY" -f "$TMP_RAW_MKV"
  fi
  ;;
stop)
  stop
  ;;
*)
  echo "Usage: record {screen|area|gif|stop} [showcase|game|clip]"
  exit 1
  ;;
esac
