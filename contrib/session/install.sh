#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
BIN="${HOME}/.local/bin"
CFG="${HOME}/.config/swirl"

mkdir -p "$BIN" "$CFG/scripts"
install -m 755 "$ROOT/bin/swaymsg" "$BIN/swaymsg"
install -m 755 "$ROOT/bin/swaynag" "$BIN/swaynag"
install -m 755 "$ROOT/bin/swaybar" "$BIN/swaybar"
install -m 644 "$ROOT/config/config" "$CFG/config"
install -m 644 "$ROOT/config/config-us" "$CFG/config-us"
install -m 644 "$ROOT/scripts/autotile.lua" "$CFG/scripts/autotile.lua"

mkdir -p "$ROOT/ly"
cat > "$ROOT/ly/swirl.desktop" <<DESKTOP
[Desktop Entry]
Name=Swirl
Comment=Light scrolling tiling Wayland compositor
Exec=env SWIRL_SESSION=1 ${HOME}/.local/bin/swirl
Type=Application
DesktopNames=swirl;sway;wlroots
DESKTOP

echo "Installed Swirl session configs and sway* shims."
echo "  config: $CFG/config"
echo "  Ensure meson-installed swirl is on PATH ($BIN/swirl)."
echo "Optional Ly: sudo cp $ROOT/ly/swirl.desktop /etc/ly/custom-sessions/"
