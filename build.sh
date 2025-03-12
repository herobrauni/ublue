#!/bin/bash

set -ouex pipefail

dnf5 -y copr enable yalter/niri-git
dnf5 -y install niri
