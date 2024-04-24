#!/bin/bash
killall -q volumeicon &
while pgrep -u $UID -x volumeicon >/dev/null; do sleep 1; done
volumeicon &
picom -b &
nm-applet &
xfce4-power-manager &
setxkbmap -layout "us,ru" -option "grp:caps_toggle"&
