#!/bin/bash

systemctl --user reset-failed
systemctl --user import-environment WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE \
  PATH EDITOR XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME XDG_BIN_HOME \
  PASSWORD_STORE_DIR NOTMUCH_CONFIG XCURSOR_THEME SSH_AUTH_SOCK

dbus-update-activation-environment --all

systemctl --user start dwl-session.target

# NOTE: these are all replaced by systemd user services
# /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# mako &
# waybar &
# qs &
# wbg -s /home/moreka/.config/wall &
# swayidle -w timeout 600 'swaylock -f' timeout 601 'wlr-dpms off' resume 'wlr-dpms on' before-sleep 'swaylock -f' &
# wl-clip-persist --clipboard regular &

killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal-gtk
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal

LOGFILE="$HOME/.cache/xdg-desktop-portal-wlr.log"
echo "starting xdg-desktop-portal-wlr" >> "$LOGFILE"
/usr/lib/xdg-desktop-portal-wlr >> "$LOGFILE" 2>&1 &

sleep 2

/usr/lib/xdg-desktop-portal &

wait
