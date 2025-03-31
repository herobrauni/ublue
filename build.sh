#!/bin/bash

set -ouex pipefail

dnf5 -y copr enable yalter/niri-git
dnf5 -y copr enable ulysg/xwayland-satellite
dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 -y copr enable che/nerd-fonts

dnf5 -y install cosmic-desktop

dnf5 -y install tailscale nerd-fonts

dnf5 -y install niri mako waybar swaybg swayidle

dnf5 -y install xdg-desktop-portal-gtk xdg-desktop-portal-gnome gnome-keyring polkit-kde xwayland-satellite

mkdir -p /etc/skel/.config/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/mako.service /etc/skel/.config/systemd/user/niri.service.wants/
ln -s /usr/lib/systemd/user/waybar.service /etc/skel/.config/systemd/user/niri.service.wants/

cp /tmp/swaybg.service /usr/lib/systemd/user/
ln -s /usr/lib/systemd/user/swaybg.service /etc/skel/.config/systemd/user/niri.service.wants/

cp /tmp/swayidle.service /usr/lib/systemd/user/
ln -s /usr/lib/user/swayidle.service /etc/skel/.config/systemd/user/niri.service.wants/

# systemctl enable cosmic-greeter

rpm-ostree install \
    code \
    tailscale \
    alacritty