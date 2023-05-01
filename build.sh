#!/bin/sh

set -uex pipefail

apt-get update && apt-get -y upgrade

aptCount=$(yq '.apt[]' < /tmp/recipe.yml | wc -l)
aptPackages=($(yq '.apt[]' < /tmp/recipe.yml))
apt-get -y install ${aptPackages[@]}

cpanCount=$(yq '.cpan[]' < /tmp/recipe.yml | wc -l)
cpanPackages=($(yq '.cpan[]' < /tmp/recipe.yml))
cpan -I ${cpanPackages[@]}
