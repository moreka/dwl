#!/bin/bash

systemctl --user import-environment WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE \
  PATH EDITOR SUDO_EDITOR XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME XDG_BIN_HOME \
  CARGO_HOME TEXMFHOME TEXMFVAR TEXMFCONFIG GOPATH GTK2_RC_FILES PASSWORD_STORE_DIR NOTMUCH_CONFIG \
  XCURSOR_THEME SSH_AUTH_SOCK

dbus-update-activation-environment --all

/usr/lib/xdg-desktop-portal &

/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

mako &
# waybar &
qs &
wbg -s /home/moreka/.config/wallpaper &
swayidle -w timeout 600 'swaylock -f' timeout 601 'wlr-dpms off' resume 'wlr-dpms on' before-sleep 'swaylock -f' &
wl-clip-persist --clipboard regular &

# somebar &
# someblocks &

wait
