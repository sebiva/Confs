#!/bin/sh
xrandr --output eDP-1 --primary --mode 1920x1080 --output HDMI-1 --off --output DP-2-2 --off

sleep 1

xrandr --output DP-2-1 --off --output DP-2-2 --mode 3840x2160 --pos 1920x0 --rotate normal --output DP-2-3 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-2 --off --output HDMI-1 --off --output DP-2 --off --output DP-1 --off
