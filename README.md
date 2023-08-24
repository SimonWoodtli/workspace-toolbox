# Container Workspace Environment for Development

[![License](https://img.shields.io/badge/license-Apache2-brightgreen.svg)](LICENSE)
[![wakatime](https://wakatime.com/badge/user/173067c8-7ded-4cfb-8605-b3032659c00c/project/5399d506-08f4-4420-9ee9-3109b510e035.svg)](https://wakatime.com/badge/user/173067c8-7ded-4cfb-8605-b3032659c00c/project/5399d506-08f4-4420-9ee9-3109b510e035)

## ⛔ Deprecated

This workspace is deprecated, Ubuntu does not have many of the CLI
programs I use in my day to day. That is why I chose Alpine for my
workspace as it has more software in the default repo. 

I initially thought I could use Nix together with Ubuntu. But Nix has
some major issues that it still needs to overcome to be friendlier on
automatic setups like this.

1. Annoying to create a cloud native workspace. Couldn't figure out how
   to get Nix manager installed in the pipe cause user is not set.
   But also post-install there were many quirks to be ironed out. Some
   of them fixable others too time consuming to be worth it.
2. Nix requires a bash auto completion package. Which like every package
   gets a different path/ID on each install/system. This makes it very
   tricky to integrate into my dotfiles/bashrc. Because another quirk
   of Nix is that you need to source the bash-completion path of the
   package in order to have bash completion work out of the box. But not
   only that, the nix bash completion package also needs to be installed
   prior to any other nix software and sourced, which makes it very
   challenging if not impossible to do within a simple post-install
   script. The fact that bash-completion does not work out of the box
   with a simple install is what gave me the final blow to decide to
   abort this workspace.
3. Trying to avoid default installer to not get the nix-env bloated
   versions. But the Determinate Systems installer wants a user scope
   which I totally agree with. But on a Container/Workspace you need to
   elevate permissions of all nix dirs to sudo in order to get it to work.

I learned a lot about Nix which is great but I think it's better to use
it either with Nix OS or on a OS directly. I do not recommend using
it in a Container and certainly not if you want that Container to be in CI/CD
pipeline.

## Description

This image is a customized workspace that includes all the tools I need for my
terminal-centric workflow and gets updated and rebuild daily. This not only
allows me to set up and maintain an up-to-date workspace, but it also helps me
keep track of my personalized installation data. Moreover, a GitHub Action is
set up to update packages and rebuild the image on a daily basis, ensuring that
I have access to the latest features and enhancements. The ultimate goal of
this setup is to provide a seamless and cloud-native UNIX terminal experience
that can be used in conjunction with a dotfile manager for
a zero-configuration, 'it just works' experience out of the box.

Not only can this image be used as a standalone on any machine that has
docker/podman installed, but it also seamlessly integrates with [my
cloud-native desktop][cloud-os] setup, providing an even more
comprehensive experience.

![Alt](https://repobeats.axiom.co/api/embed/8669e2900a391e71c6dea82c54487e6a3034966b.svg "Repobeats analytics image")

[cloud-os]: <https://github.com/simonwoodtli/cloud-os>

Related:

* <https://github.com/ublue-os>
* <https://github.com/rwxrob/workspace>
* <https://remy.grunblatt.org/nix-and-nixos-my-pain-points.html>
