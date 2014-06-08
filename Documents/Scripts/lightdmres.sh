#!/bin/sh

# Sets the correct resolution for the login screen.
# Runs from: "display-setup-script=/usr/share/lightdmres.sh" in
# "/etc/lightdm/lightdm.conf"
# Source : http://www.sudo-juice.com/lightdm-resolution/

INPUT=`xrandr -q | grep "VGA1 connected"`
if [ "$INPUT" ]; then
	xrandr --output LVDS1 --off
	xrandr --output VGA1 --primary --mode 1920x1080
else
	xrandr --output LVDS1 --primary --mode 1366x768
fi
