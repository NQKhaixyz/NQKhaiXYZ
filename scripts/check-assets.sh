#!/usr/bin/env bash
set -euo pipefail

missing=0

req=(
  assets/chibi-coffee.gif
  assets/chibi-type.gif
  assets/chibi-star.gif
  assets/chibi-read.gif
  assets/chibi-wave.gif
  assets/chibi-divider-gothic.svg
  assets/profile-avatar.png
  assets/profile-banner.png
)

for f in "${req[@]}"; do
  if [ ! -f "$f" ]; then
    echo "MISSING: $f"; missing=1
  fi
done

if [ $missing -eq 1 ]; then
  echo "Some required assets are missing. Please add them to assets/ (see ASSETS.md)."
  exit 1
fi

# Size checks
fail=0
for g in assets/*.gif; do
  [ -e "$g" ] || continue
  size=$(stat -c%s "$g")
  if [ "$size" -gt 2097152 ]; then
    echo "TOO LARGE: $g ($size bytes) > 2MB"; fail=1
  fi
done

echo "All required assets present. GIF sizes OK (<2MB)."
exit $fail
