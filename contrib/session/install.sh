#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
CFG="${HOME}/.config/sway"

mkdir -p "$CFG/scripts"
install -m 644 "$ROOT/config/config" "$CFG/config"
install -m 644 "$ROOT/config/config-us" "$CFG/config-us"
install -m 644 "$ROOT/scripts/autotile.lua" "$CFG/scripts/autotile.lua"

mkdir -p "${HOME}/.local/share/wayland-sessions"
cat > "${HOME}/.local/share/wayland-sessions/swirl.desktop" <<DESKTOP
[Desktop Entry]
Name=Swirl
Comment=Light scrolling tiling Wayland compositor (uses swaybar/swaymsg/swaynag)
Exec=${HOME}/.local/bin/swirl
Type=Application
DesktopNames=swirl;sway;wlroots
DESKTOP

echo "Installed Swirl example session into $CFG"
echo "  Ensure meson-installed swirl is on PATH (${HOME}/.local/bin/swirl)."
echo "  Uses system swaybar, swaymsg, and swaynag."
echo "Optional Ly: sudo cp $ROOT/ly/swirl.desktop /etc/ly/custom-sessions/"
