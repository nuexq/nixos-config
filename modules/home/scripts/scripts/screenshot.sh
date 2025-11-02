#!/usr/bin/env bash

dir="$HOME/Pictures/Screenshots"
time=$(date +'%Y_%m_%d_at_%Hh%Mm%Ss')
file="${dir}/Screenshot_${time}.png"

mkdir -p "$dir"

fullscreen() {
  grim "$file"
  wl-copy <"$file"
  notify-send "Screenshot" "Saved fullscreen as $file and copied to clipboard" -i "$file"
}

freeze_copy() {
  GRIMBLAST_HIDE_CURSOR=0 grimblast --notify --freeze copy area
}

nonfreeze_copy() {
  grim -g "$(slurp)" - | wl-copy
}

# Handle arguments
case "$1" in
--fullscreen) fullscreen ;;
--freeze-copy) freeze_copy ;;
--nonfreeze-copy) nonfreeze_copy ;;
*)
  echo "Available options: --fullscreen --freeze-copy --nonfreeze-copy"
  exit 1
  ;;
esac
