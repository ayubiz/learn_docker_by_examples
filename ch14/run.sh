#!/bin/sh
curl -fsSL https://get.docker.com/ | sh
sudo gpasswd -a andy docker
echo "complete!"