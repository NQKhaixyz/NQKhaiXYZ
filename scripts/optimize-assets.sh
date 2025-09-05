#!/usr/bin/env bash
set -euo pipefail

# Requirements: gifsicle, pngquant (install via apt or package manager)
# Usage: ./scripts/optimize-assets.sh

echo "Optimizing GIFs (<2MB target, lossy 30, 128 colors)"
find assets -type f -name '*.gif' -print0 | while IFS= read -r -d '' f; do
  tmp="${f%.gif}.opt.gif"
  if command -v gifsicle >/dev/null 2>&1; then
    gifsicle -O3 --colors=128 --lossy=30 "$f" -o "$tmp" || true
    if [ -f "$tmp" ]; then
      if [ $(stat -c%s "$tmp") -lt $(stat -c%s "$f") ]; then
        mv "$tmp" "$f"
        echo "Optimized: $f"
      else
        rm -f "$tmp"
      fi
    fi
  else
    echo "Skip (no gifsicle): $f"
  fi

done

echo "Optimizing PNGs (pngquant 70-90)"
find assets -type f -name '*.png' -print0 | while IFS= read -r -d '' f; do
  if command -v pngquant >/dev/null 2>&1; then
    pngquant --quality=70-90 --strip --force --output "$f" -- "$f" || true
    echo "Optimized: $f"
  else
    echo "Skip (no pngquant): $f"
  fi

done

echo "Done."
