#!/bin/bash
picom -b &
nm-applet &
xfce4-power-manager &
setxkbmap -layout "us,ru" -option "grp:caps_toggle"&
xrandr --output HDMI-2 --scale 1.5x1.5&

