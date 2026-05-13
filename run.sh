#!/bin/sh

turnstile-update-runit-env WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE

/usr/libexec/polkit-mate-authentication-agent-1 &
# /home/moreka/.config/niri/scripts/swayidle.sh
mako &
# waybar
wbg -s /home/moreka/.config/wallpaper &

wait
