#!/bin/bash

set -ouex pipefail

dnf5 -y copr enable yalter/niri-git
echo "priority=1" | tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo
dnf5 -y copr enable ulysg/xwayland-satellite
# dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 -y copr enable che/nerd-fonts

# dnf5 -y install cosmic-desktop

dnf5 -y install tailscale nerd-fonts

dnf5 -y install niri mako waybar swaybg swayidle

# dnf5 -y install @xfce-desktop-environment

dnf5 -y install xdg-desktop-portal-gtk xdg-desktop-portal-gnome gnome-keyring polkit-kde xwayland-satellite xwaylandvideobridge

mkdir -p /etc/skel/.config/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/mako.service /etc/skel/.config/systemd/user/niri.service.wants/
ln -s /usr/lib/systemd/user/waybar.service /etc/skel/.config/systemd/user/niri.service.wants/

cp /tmp/swaybg.service /usr/lib/systemd/user/
ln -s /usr/lib/systemd/user/swaybg.service /etc/skel/.config/systemd/user/niri.service.wants/

cp /tmp/swayidle.service /usr/lib/systemd/user/
ln -s /usr/lib/user/swayidle.service /etc/skel/.config/systemd/user/niri.service.wants/

# systemctl disable sddm
# systemctl enable cosmic-greeter

dnf5 -y install \
    code \
    tailscale \
    alacritty \
    gcc \
    docker-compose \
    procps-ng curl file git

dnf5 -y group install development-tools

dnf5 -y remove fish
