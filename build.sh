#!/bin/sh

set -uex pipefail

apt-get update && apt-get -y upgrade

## install nix package manager:
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm

aptCount=$(yq '.apt[]' < /tmp/recipe.yml | wc -l)
aptPackages=($(yq '.apt[]' < /tmp/recipe.yml))
apt-get -y install ${aptPackages[@]}

nixCount=$(yq '.nix[]' < /tmp/recipe.yml | wc -l)
nixPackages=($(yq '.nix[]' < /tmp/recipe.yml))

#cpan -I Term::Animation
