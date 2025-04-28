#!/bin/bash

bash ./wireguard-install/wireguard-install.sh;

cp -rf /home/deploy/wg0-* ./wireguard-install;

exit 0
