TMPBG=/tmp/screen.png
BLUR=~/.config/swaylock/lock.png

grim $TMPBG
python blur.py
swaylock -i $BLUR
rm $TMPBG
