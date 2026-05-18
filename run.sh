#!/bin/bash

turnstile-update-runit-env WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE

/usr/libexec/xdg-desktop-portal &
/usr/libexec/xdg-desktop-portal-wlr &
/usr/libexec/polkit-mate-authentication-agent-1 &
mako &
waybar &
wbg -s /home/moreka/.config/wallpaper &
swayidle -w timeout 600 'swaylock -f' timeout 601 'wlr-dpms off' resume 'wlr-dpms on' before-sleep 'swaylock -f' &
wl-clip-persist --clipboard regular &

wait
