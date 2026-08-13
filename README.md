
https://github.com/user-attachments/assets/67bc7143-77e9-422a-bc40-d9f2429ebd39

# Swirl

<table>
  <tr>
    <td>
      <strong>A very lightweight scrolling tiling window manager for Wayland.
<br>
    </td>
    <td>
  <img src="assets/Swirl.png" alt="Swirl" width="220">
</td>
  </tr>
</table>

**Swirl** is forked from [Scroll](https://github.com/dawsers/scroll) (itself a fork of [Sway](https://github.com/swaywm/sway)), shaped by ideas from [Niri](https://github.com/YaLTeR/niri)

Windows are **columns on an infinite strip** that scroll horizontally. Workspaces are **dynamic** and move vertically. Config language stays Sway-compatible.

Swirl intentionally **does not fork** the status bar, IPC client, or nag bar. Use stock **swaybar**, **swaymsg**, and **swaynag** from your distro — same i3/sway IPC.

---

## What you get

| Piece | Name |
|-------|------|
| Compositor | `swirl` |
| Config dir | `~/.config/sway/` (Sway-compatible; `~/.config/swirl/` still works as fallback) |
| IPC socket | `$XDG_RUNTIME_DIR/sway-ipc.*.sock` (exported as `SWAYSOCK`) |
| Bar / IPC / nag | system `swaybar` / `swaymsg` / `swaynag` |

Lua scripts keep the Scroll API: `require("scroll")` (and `require("swirl")` where available).

---

## Layout & gestures (example session)

Example config under `contrib/session` auto-tiles columns:

| Windows | Behavior |
|--------:|----------|
| 1 | Full width |
| 2 | 50 / 50 |
| 3 | 50 / 50 + full-width on the right |
| 4+ | Pairs of 50 / 50; odd last column full |

| Gesture | Action |
|---------|--------|
| 3-finger left / right | Scroll the window strip |
| 4-finger up / down | Next / previous workspace |
| 2-finger scroll | Natural scrolling inside apps |

---

## Build

Dependencies match Scroll/Sway (wlroots 0.21, wayland, json-c, pango, cairo, …). Install distro packages for `sway`, `swaybg`, `swayidle`, `swaylock` (or equivalents) so `swaymsg` / `swaybar` / `swaynag` are available.

```bash
git clone https://github.com/visnudeva/swirl.git
cd swirl
meson setup build --prefix="$HOME/.local" \
  -D sd-bus-provider=libsystemd \
  -D werror=false \
  -D b_ndebug=true
ninja -C build
ninja -C build install
```

This installs **only** the compositor (`swirl`) by default. Optional `-D scrollbar=true` / `-D scrollnag=true` / `-D swaymsg=true` build the old forked helpers; prefer system tools instead.

### Optional example session

```bash
./contrib/session/install.sh
```

Installs example configs into `~/.config/sway/` (FR + US) and pair auto-tiling Lua. Launch `swirl` or pick **Swirl** in your greeter after installing `swirl.desktop`.

---

## Repository layout

```
.                      # compositor source (Scroll → Sway lineage)
contrib/session/       # optional example configs + autotile
swirl.desktop          # wayland-sessions entry
TUTORIAL.md            # Scroll tutorial (layout commands still apply)
```

---

## Upstream

Swirl ships as its own compositor binary (`swirl`) while staying wired into the Sway ecosystem for tooling and `~/.config/sway`. Layout features from Scroll (overview, jump, spaces, trails, animations, …) remain available — see [TUTORIAL.md](./TUTORIAL.md). Some man page filenames still say `scroll`; the content applies.

- Based on [dawsers/scroll](https://github.com/dawsers/scroll) `1.12.17`
- Wayland / wlroots stack shared with Sway
