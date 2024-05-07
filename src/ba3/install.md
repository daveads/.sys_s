# Arch linux

sudo pacman -S cronie
systemctl enable --now cronie.service
crontab  -e
