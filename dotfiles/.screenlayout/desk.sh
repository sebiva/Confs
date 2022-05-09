#!/bin/sh
xrandr -s 0
sleep 3
xrandr --output eDP-1 --primary --mode 1920x1080 \
       --output HDMI-1 --off \
       --output DP-2-1 --off \
       --output DP-2-2 --off \
       --output DP-2-3 --off
#xrandr --output eDP-1 --primary --mode 1920x1080 --output HDMI-1 --off --output DP-2-2 --off

sleep 3
xrandr --output eDP-1 --off \
       --output DP-2-1 --primary --mode 1920x1080 --rotate normal
sleep 3

xrandr --output DP-2-1 --mode 3840x2160 --pos 1920x0 --rotate normal \
       --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal
