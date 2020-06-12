#!/bin/bash
#
# This scripts installs WordPressDev environment dependencies.
#
# WordPressDev, Copyright 2019 Google LLC
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

if [[ -z "$LANDO_MOUNT" ]]; then
    echo "Error: Must be run the appserver.";
    exit 1
fi

echo "Installing Dependencies"

apt-get update -y
apt-get -y install libyaml-dev
yes | pecl install yaml
echo 'extension=yaml.so' > /usr/local/etc/php/conf.d/yaml.ini

curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install nodejs -y

apt-get install zip -y
