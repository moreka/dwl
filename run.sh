#!/bin/bash

turnstile-update-runit-env WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE </dev/null

/usr/libexec/xdg-desktop-portal </dev/null &
/usr/libexec/xdg-desktop-portal-wlr </dev/null &
/usr/libexec/polkit-mate-authentication-agent-1 </dev/null &
mako </dev/null &
waybar </dev/null &
wbg -s /home/moreka/.config/wallpaper </dev/null &
# /home/moreka/.config/niri/scripts/swayidle.sh </dev/null &

rm -f /tmp/dwl-waybar.status.eDP-1
rm -f /tmp/dwl-waybar.status.HDMI-A-1

/home/moreka/builds/dwl-waybar/dwlway >/tmp/logggg

wait
