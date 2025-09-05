#!/usr/bin/env bash
set -euo pipefail

R=README.md

if [ ! -f assets/chibi-coffee.gif ]; then
  echo "GIFs not generated yet. Run scripts/generate-assets.sh first." >&2
  exit 0
fi

sed -i \
  -e 's#assets/chibi-coffee\.svg#assets/chibi-coffee.gif#g' \
  -e 's#assets/chibi-star\.svg#assets/chibi-star.gif#g' \
  -e 's#assets/chibi-type\.svg#assets/chibi-type.gif#g' \
  -e 's#assets/chibi-read\.svg#assets/chibi-read.gif#g' \
  -e 's#assets/chibi-wave\.svg#assets/chibi-wave.gif#g' \
  "$R"

echo "Updated README.md to use .gif assets."