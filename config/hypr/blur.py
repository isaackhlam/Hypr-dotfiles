from PIL import Image, ImageFilter
from pathlib import Path

tmp = Image.open('/tmp/screen.png')
blur = tmp.filter(ImageFilter.GaussianBlur(8))
blur.save(str(Path.home()) + '/.config/swaylock/lock.png')
