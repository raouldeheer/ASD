#!/bin/bash
echo "Installing ASD..."
wget -O /usr/bin/asd -q --show-progress https://github.com/raouldeheer/ASD/releases/latest/download/asd.sh
chmod u+x,g+x /usr/bin/asd
echo "ASD installed!"
