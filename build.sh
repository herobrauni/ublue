#!/bin/bash

set -ouex pipefail

dnf5 -y copr enable yalter/niri-git
dnf5 -y install niri mako waybar swaybg swayidle

mkdir -p /etc/skel/.config/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/mako.service /etc/skel/.config/systemd/user/niri.service.wants/
ln -s /usr/lib/systemd/user/waybar.service /etc/skel/.config/systemd/user/niri.service.wants/

cp /tmp/swaybg.service /usr/lib/systemd/user/
ln -s /usr/lib/systemd/user/swaybg.service /etc/skel/.config/systemd/user/niri.service.wants/

cp /tmp/swayidle.service /usr/lib/systemd/user/
ln -s ~/.config/systemd/user/swayidle.service /etc/skel/.config/systemd/user/niri.service.wants/