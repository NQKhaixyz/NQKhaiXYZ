# Assets Checklist and Guidelines

This repository powers your GitHub profile README. Use this file as a checklist to keep assets consistent, lightweight, and accessible.

## Required Assets (filenames must match README)
- assets/chibi-wave.gif — alt: "chibi waving hello" — Hero (top-right), height 80px, < 2MB
- assets/chibi-coffee.gif — alt: "chibi sipping coffee" — Gallery, height 72px, < 1.5MB
- assets/chibi-type.gif — alt: "chibi typing calmly" — Gallery, height 72px, < 1.5MB
- assets/chibi-star.gif — alt: "chibi holding a star, sparkles" — Gallery, height 72px, < 1.5MB
- assets/chibi-read.gif — alt: "chibi reading a book" — Gallery, height 72px, < 1.5MB
- assets/chibi-divider-gothic.svg — alt: "gothic sparkle divider" — Section breaks, height 28–32px

## Optional Profile Visuals
- assets/profile-avatar.png — alt: "radiant chibi avatar (CM initials, sparkles)" — 400×400 PNG
- assets/profile-banner.png — alt: "starry gradient banner (blue × red-gold × pink)" — ~1280×360 PNG
- assets/profile-banner.svg — scalable banner (template provided)
- assets/profile-avatar.svg — scalable avatar (template provided)

Color hints by vibe:
- Mahiru (base): blue `#1e90ff`, background `#f7f9ff`
- Kurumi (subtle): deep accents `#111827`/black, star gold `#d4af37`
- Nino (highlights): pink `#ff7aa2`, purple `#8a7cf4`

## Color and Motion
- Palette: primary `#1e90ff`, background `#f7f9ff`, text `#2b2b2b`/`#6b7280`
- Motion: gentle loops (low FPS), no flashing or rapid transitions

## Optimization Commands (optional but recommended)

```bash
# GIF optimization (reduce colors + mild lossy compression)
# requires: gifsicle
gifsicle -O3 --colors=128 --lossy=30 input.gif -o output.gif

# PNG optimization
# requires: pngquant (or use oxipng/optipng)
pngquant --quality=70-90 --strip --force --output optimized.png input.png

# APNG alternative (optional)
# requires: apngasm
# apngasm output.png frame1.png 1 frame2.png 1 ...
```

## Accessibility
- Ensure each image has descriptive `alt` text (already in README)
- Maintain good contrast (dark text on light background)

## Replacement Steps
1) Place optimized files into `assets/` with the exact filenames above.
2) Commit and push. Verify README renders on GitHub.
3) If you rename any asset, update the paths in `README.md` accordingly.
4) Placeholders: `.svg` placeholders are provided for all chibi GIFs. You can keep them as-is or replace them with your final `.gif` versions at any time.

Tip: Keep each GIF loop calm (low FPS, subtle motion) to match Mahiru/Kurumi/Nino vibes.

## Sourcing Guidance and AI Prompt

Use only assets you have rights to. Inspiration links (Pinterest/Tenor/Zerochan/Pixiv) often host copyrighted content. Do not hotlink or reuse without permission. Prefer:
- Your own original art
- AI-generated art you own the rights to
- Public domain or permissively licensed works (Openverse, CC0, CC BY)

AI generation prompt (edit for your tool and style):

Ultra-detailed chibi anime illustration of Mahiru Shiina, Kurumi Tokisaki, and Nino Nakano,
vivid radiant colors, sparkling light effects, dreamy magical bokeh,
adorable proportions, kawaii expressive faces, soft glowing hair with colorful highlights,
Mahiru: gentle soft blue-white aura, cozy and wholesome,
Kurumi: gothic black-red-gold sparkles, mysterious and elegant,
Nino: lively pink-purple accents, tsundere playful charm,
background layered gradient (blue sky + starry night + soft pink glow),
fantasy magical atmosphere, glowing sparkles around, professional polished anime art,
highly vibrant, web optimized for profile aesthetics, <2MB per GIF, calm loop (low FPS).

Negative prompt: nsfw, explicit, violent, low quality, blurry, text, watermark, cluttered background

Vibe placements in README:
- Hero: Mahiru coffee chibi (assets/chibi-coffee.gif)
- Gallery: Kurumi star chibi (assets/chibi-star.gif), Nino typing (assets/chibi-type.gif), Mahiru reading (assets/chibi-read.gif), Mahiru wave (assets/chibi-wave.gif)
- Banner: layered gradient of Mahiru × Kurumi × Nino (assets/profile-banner.png)
