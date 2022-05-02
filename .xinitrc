#!bin/bash

[ -f ~/.xprofile ] && . ~/.xprofile


xrandr --output HDMI-1 --mode 1920x1080 \
    --rotate left \
    --left-of DP-1 \
    --output DP-1 --mode 1920x1080 \
    --primary \

exec /usr/local/bin/stumpwm 
