#!/bin/bash

set -uex pipefail

apt-get update && apt-get -y upgrade

declare -i aptCount=$(yq '.apt[]' < /tmp/recipe.yml | wc -l)
declare -a aptPackages=( $(yq '.apt[]' < /tmp/recipe.yml) )
apt-get -y install ${aptPackages[@]}

declare -i cpanCount=$(yq '.cpan[]' < /tmp/recipe.yml | wc -l)
declare -a cpanPackages=( $(yq '.cpan[]' < /tmp/recipe.yml) )
cpan -I ${cpanPackages[@]}
