# Raw Assets Staging

Drop your source images here with EXACT filenames below, then push. CI will auto-generate optimized assets and update the main README to use the new GIFs.

Mapping (based on your images):
- kurumi-gothic.jpg — red/black gothic dress with clock background (Kurumi)
- nino-tsundere.jpg — pink-haired with blue butterfly clips (Nino)
- mahiru-cozy.jpg — blonde in teddy bear kigurumi holding a teddy (Mahiru)
- mahiru-hero.jpg — chibi blonde cat-hoodie with popsicle (Mahiru)
- banner-source.jpg — (optional) banner base image (1280×360 target)
- avatar-source.jpg — (optional) avatar base image (400×400 target)

If your files are PNG, use the same base name with `.png`.

After push, workflow will render to:
- assets/chibi-star.gif (Kurumi)
- assets/chibi-type.gif (Nino)
- assets/chibi-read.gif (Mahiru)
- assets/chibi-wave.gif (Mahiru)
- assets/chibi-coffee.gif (Mahiru)
- assets/profile-banner.png (if banner-source provided)
- assets/profile-avatar.png (if avatar-source provided)

Local alternative:
- Ensure ImageMagick + gifsicle (and pngquant optional) are installed
- Run: `./scripts/generate-assets.sh` then `./scripts/swap-readme-to-gif.sh`

Rights: only use images you own or have permission to use (see `ASSETS_RIGHTS.md`).
