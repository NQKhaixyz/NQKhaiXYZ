#!/usr/bin/env bash
set -euo pipefail

# Requires: ImageMagick (convert), gifsicle, pngquant (optional)
# Source files expected in assets/raw/ with these names:
#  - mahiru-hero.(png|jpg)
#  - kurumi-gothic.(png|jpg)
#  - nino-tsundere.(png|jpg)
#  - mahiru-cozy.(png|jpg)
#  - cute-paw.(png|jpg)   # for wave/paw pose
#  - banner-source.(png|jpg)
#  - avatar-source.(png|jpg)
# Outputs:
#  - assets/chibi-coffee.gif
#  - assets/chibi-star.gif
#  - assets/chibi-type.gif
#  - assets/chibi-read.gif
#  - assets/chibi-wave.gif
#  - assets/profile-banner.png
#  - assets/profile-avatar.png

RAW=assets/raw
OUT=assets
mkdir -p "$OUT"

kenburns_gif() {
  local in=$1 out=$2 size=${3:-720} morph=${4:-18} endzoom=${5:-105%}
  local tmpdir
  tmpdir=$(mktemp -d)
  # Prepare base square
  convert "$in" -resize ${size}x${size}^ -gravity center -extent ${size}x${size} "$tmpdir/start.png"
  convert "$tmpdir/start.png" -resize $endzoom -gravity center -extent ${size}x${size} "$tmpdir/end.png"
  convert -delay 6 \( "$tmpdir/start.png" "$tmpdir/end.png" -morph $morph \) -loop 0 "$tmpdir/out.gif"
  if command -v gifsicle >/dev/null 2>&1; then
    gifsicle -O3 --colors=128 --lossy=30 "$tmpdir/out.gif" -o "$out"
  else
    mv "$tmpdir/out.gif" "$out"
  fi
  rm -rf "$tmpdir"
}

png_smart() {
  local in=$1 out=$2 size=${3:-1280x360}
  convert "$in" -resize "$size^" -gravity center -extent "$size" "$out"
  if command -v pngquant >/dev/null 2>&1; then
    pngquant --quality=70-90 --strip --force --output "$out" -- "$out" || true
  fi
}

need=(
  "$RAW/mahiru-hero.jpg" "$RAW/mahiru-hero.png"
  "$RAW/kurumi-gothic.jpg" "$RAW/kurumi-gothic.png"
  "$RAW/nino-tsundere.jpg" "$RAW/nino-tsundere.png"
  "$RAW/mahiru-cozy.jpg" "$RAW/mahiru-cozy.png"
  "$RAW/cute-paw.jpg" "$RAW/cute-paw.png"
  "$RAW/banner-source.jpg" "$RAW/banner-source.png"
  "$RAW/avatar-source.jpg" "$RAW/avatar-source.png"
)

have_any=false
for f in "${need[@]}"; do
  if [ -f "$f" ]; then have_any=true; break; fi
done

if [ "$have_any" = false ]; then
  echo "No source images found in $RAW. See assets/raw/README.md for naming." >&2
  exit 1
fi

# Map inputs to outputs (pick existing extension)
src() { [ -f "$1.jpg" ] && echo "$1.jpg" || echo "$1.png"; }

[ -f "$(src $RAW/mahiru-hero)" ] && kenburns_gif "$(src $RAW/mahiru-hero)" "$OUT/chibi-coffee.gif" 720 18 105%
[ -f "$(src $RAW/kurumi-gothic)" ] && kenburns_gif "$(src $RAW/kurumi-gothic)" "$OUT/chibi-star.gif" 720 18 103%
[ -f "$(src $RAW/nino-tsundere)" ] && kenburns_gif "$(src $RAW/nino-tsundere)" "$OUT/chibi-type.gif" 720 18 104%
[ -f "$(src $RAW/mahiru-cozy)" ] && kenburns_gif "$(src $RAW/mahiru-cozy)" "$OUT/chibi-read.gif" 720 18 103%
[ -f "$(src $RAW/cute-paw)" ] && kenburns_gif "$(src $RAW/cute-paw)" "$OUT/chibi-wave.gif" 720 18 104%

[ -f "$(src $RAW/banner-source)" ] && png_smart "$(src $RAW/banner-source)" "$OUT/profile-banner.png" 1280x360
[ -f "$(src $RAW/avatar-source)" ] && png_smart "$(src $RAW/avatar-source)" "$OUT/profile-avatar.png" 400x400

echo "Generated assets in $OUT/"