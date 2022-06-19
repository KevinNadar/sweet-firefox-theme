#!/usr/bin/env bash

VERSION=$(curl --silent "https://api.github.com/repos/rafaelmardojai/firefox-gnome-theme/releases/latest" | grep tag_name | cut -d'"' -f4)
FILENAME=sweet-firefox-theme-$VERSION.tar.gz

(

cd $(mktemp -d) || exit 1
mkdir sweet-firefox-theme
cd sweet-firefox-theme

curl -LJo $FILENAME https://github.com/KevinNadar/sweet-firefox-theme/tarball/$VERSION

tar -xzf $FILENAME --strip-components=1

chmod +x scripts/auto-install.sh

./scripts/auto-install.sh

)
