#!/bin/sh
## manage host from within workspace
ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/docker
ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/flatpak
ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/podman
ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
ln -sf /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update
## packages that I need but are not on ubuntu yet
