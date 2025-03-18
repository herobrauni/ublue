ARG BASE_IMAGE=ghcr.io/ublue-os/bluefin-dx:stable-daily
FROM ${BASE_IMAGE}

# List of supported base images:
# - ghcr.io/ublue-os/bluefin-dx:stable-daily
# - ghcr.io/ublue-os/aurora-dx:stable-daily
# 
# Additional base images can be found at:
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY build.sh /tmp/build.sh

COPY swaybg.service /tmp/swaybg.service
COPY swayidle.service /tmp/swayidle.service

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit

COPY brew-install.sh /tmp/brew-install.sh
RUN mkdir -p /var/lib/alternatives && \
    /tmp/brew-install.sh && \
    ostree container commit
