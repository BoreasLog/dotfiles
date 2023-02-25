#!bin/bash

[ -f ~/.xprofile ] && . ~/.xprofile

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps 

# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape' 
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY
XAUTHORITY

feh --bg-fill ~/Wall/jet.jpg --bg-fill ~/Wall/planes.jpg &


exec emacs --daemon &
exec dwmblocks &

xrandr --output DP-3 --mode 1920x1080 \
    --rotate left \
    --right-of HDMI-1 \
    --output HDMI-1 --mode 1920x1080 \
    --primary \
    

exec dwm 


#exec wmaker 
