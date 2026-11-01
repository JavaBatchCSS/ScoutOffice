#!/usr/bin/env bash
set -euo pipefail

source_dir=$1
upstream_name=$2
display_name=$3

find "$source_dir" -type f \( -name '*.html' -o -name '*.rs' -o -name '*.toml' -o -name '*.json' -o -name '*.css' \) -print0 |
  xargs -0r sed -i "s/${upstream_name}/${display_name}/g"
find "$source_dir" -type f -name '*.html' -print0 |
  xargs -0r sed -i 's/<html lang="en">/<html lang="fr">/g; s/Loading /Chargement de /g'
