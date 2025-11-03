#!/usr/bin/env bash

dir="$HOME/Pictures/Screenshots"
time=$(date +'%Y_%m_%d_at_%Hh%Mm%Ss')
file="${dir}/Screenshot_${time}.png"

mkdir -p "$dir"

fullscreen() {
    hyprshot -m monitor --output "$file" --copy
}

freeze_copy() {
    hyprshot -z -m region --clipboard-only
}

nonfreeze_copy() {
    hyprshot -m region --clipboard-only
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
