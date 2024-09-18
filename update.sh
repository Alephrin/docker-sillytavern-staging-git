#!/bin/bash
cd /app/SillyTavern
if [ ! -e "config/config.yaml" ]; then
    echo "Resource not found, copying from defaults: config.yaml"
    cp -r "default/config.yaml" "config/config.yaml"
fi
if [ ! -e "config/user.css" ]; then
    echo "Resource not found, copying from defaults: user.css"
    cp -r "default/user.css" "config/user.css"
fi
git pull
source ~/.bashrc
./start.sh --listen
