# Raw Assets Staging

Drop the source images (from your attachments) here with EXACT filenames below, then push. CI will auto-generate optimized assets.

Mapping (based on your images):
- kurumi-gothic.jpg — the red/black gothic dress with clock background (Kurumi)
- nino-tsundere.jpg — the pink-haired girl with blue butterfly clips (Nino)
- maihru-cozy.jpg — the blonde girl in a teddy bear kigurumi holding a teddy (Mahiru)
- maihru-hero.jpg — the chibi blonde cat-hoodie with popsicle (Mahiru)
- banner-source.jpg — (optional) a composite/banner source; if not available, skip
- avatar-source.jpg — (optional) a square avatar source; if not available, skip

If your files are PNG, just use .png extension with the same base name.

After pushing, the workflow will render:
- assets/chibi-star.gif (Kurumi)
- assets/chibi-type.gif (Nino)
- assets/chibi-read.gif (Mahiru)
- assets/chibi-wave.gif (Mahiru)
- assets/chibi-coffee.gif (Mahiru)
- assets/profile-banner.png (if banner-source provided)
- assets/profile-avatar.png (if avatar-source provided)

Local alternative:
- Ensure ImageMagick + gifsicle (and pngquant optional) are installed
- Run: ./scripts/generate-assets.sh
