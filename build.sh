#!/bin/bash

set -ouex pipefail

dnf5 -y copr enable yalter/niri-git
echo "priority=1" | tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo
dnf5 -y copr enable ulysg/xwayland-satellite && dnf5 -y install xwayland-satellite
# dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 -y copr enable che/nerd-fonts

dnf5 -y install docker-compose --skip-broken

# dnf5 -y install cosmic-desktop

dnf5 -y install tailscale nerd-fonts

dnf5 -y install niri # mako waybar swaybg swayidle

# dnf5 -y install @xfce-desktop-environment

# dnf5 -y install xdg-desktop-portal-gtk xdg-desktop-portal-gnome gnome-keyring polkit-kde xwayland-satellite xwaylandvideobridge

# mkdir -p /etc/skel/.config/systemd/user/niri.service.wants
# ln -s /usr/lib/systemd/user/mako.service /etc/skel/.config/systemd/user/niri.service.wants/
# ln -s /usr/lib/systemd/user/waybar.service /etc/skel/.config/systemd/user/niri.service.wants/

# cp /tmp/swaybg.service /usr/lib/systemd/user/
# ln -s /usr/lib/systemd/user/swaybg.service /etc/skel/.config/systemd/user/niri.service.wants/

# cp /tmp/swayidle.service /usr/lib/systemd/user/
# ln -s /usr/lib/user/swayidle.service /etc/skel/.config/systemd/user/niri.service.wants/

# systemctl disable sddm
# systemctl enable cosmic-greeter

dnf5 -y install \
    code \
    tailscale \
    alacritty \
    gcc \
    rust cargo \
    procps-ng curl file git

dnf5 -y group install development-tools

dnf5 -y remove fish

### COSMIC EXTERNAL NIRI
curl -L https://raw.githubusercontent.com/Drakulix/cosmic-ext-extra-sessions/refs/heads/main/niri/cosmic-ext-niri.desktop -o /usr/share/wayland-sessions/cosmic-ext-niri.desktop
mkdir -p /var/usrlocal/bin
curl -L https://raw.githubusercontent.com/Drakulix/cosmic-ext-extra-sessions/refs/heads/main/niri/start-cosmic-ext-niri -o /var/usrlocal/bin/start-cosmic-ext-niri
chmod +x /var/usrlocal/bin/start-cosmic-ext-niri

### DMS FOR NIRI
dnf5 -y copr enable errornointernet/quickshell
dnf5 -y install quickshell-git
curl -L "https://github.com/google/material-design-icons/raw/master/variablefont/MaterialSymbolsRounded%5BFILL%2CGRAD%2Copsz%2Cwght%5D.ttf" -o /usr/share/fonts/MaterialSymbolsRounded.ttf
curl -L "https://github.com/rsms/inter/raw/refs/tags/v4.1/docs/font-files/InterVariable.ttf" -o /usr/share/fonts/InterVariable.ttf
curl -L "https://github.com/tonsky/FiraCode/releases/latest/download/FiraCode-Regular.ttf" -o /usr/share/fonts/FiraCode-Regular.ttf

mkdir -p /etc/skel/.config/quickshell && git clone https://github.com/AvengeMedia/DankMaterialShell.git /etc/skel/.config/quickshell/dms
curl -L https://github.com/AvengeMedia/danklinux/releases/latest/download/dms-$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/').gz | gunzip | tee /var/usrlocal/bin/dms > /dev/null && chmod +x /var/usrlocal/bin/dms
ls /var/usrlocal/bin

dnf5 -y install cava wl-clipboard brightnessctl
dnf5 -y copr enable wef/cliphist && dnf5 -y install cliphist
dnf5 -y copr enable heus-sueh/packages && dnf5 -y install matugen

curl -L https://github.com/AvengeMedia/dgop/releases/latest/download/dgop-linux-$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/').gz | gunzip | tee /var/usrlocal/bin/dgop > /dev/null && chmod +x /var/usrlocal/bin/dgop


