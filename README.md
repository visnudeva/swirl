# Swirl

A **very light scrolling tiling window manager** for Wayland.

**Swirl is forked from [Scroll](https://github.com/dawsers/scroll) (itself a fork of [Sway](https://github.com/swaywm/sway)), and shaped by ideas from [Niri](https://github.com/YaLTeR/niri) and [PaperWM](https://github.com/paperwm/PaperWM).

Windows are **columns on an infinite strip** that scroll horizontally. Workspaces are **dynamic** and move vertically. You keep Sway’s config language and a similar resource profile.

---

## What you get

| Piece | Name |
|-------|------|
| Compositor | `swirl` |
| IPC client | `swirlmsg` |
| Status bar | `swirlbar` |
| Nag bar | `swirlnag` |
| Config dir | `~/.config/swirl/` |
| IPC socket | `$XDG_RUNTIME_DIR/swirl-ipc.*.sock` (also exported as `SWAYSOCK`) |

Lua scripts can use `require("swirl")` or the Scroll-compatible alias `require("scroll")`.

---

## Layout & gestures (Swirl defaults)

Example session config (`contrib/session`) auto-tiles columns:

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

Dependencies match Scroll/Sway (wlroots 0.21, wayland, json-c, pango, cairo, …).

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

This installs the compositor and tools into `~/.local/bin`:

- `swirl` — the Wayland compositor  
- `swirlmsg` — IPC client  
- `swirlbar` — status bar  
- `swirlnag` — nag bar  

### Optional example session

```bash
./contrib/session/install.sh
```

Installs example configs (FR + US), pair auto-tiling Lua, and optional `swaymsg` / `swaynag` / `swaybar` shims that forward to Swirl when `SWIRL_SESSION=1`.

Launch:

```bash
SWIRL_SESSION=1 swirl
```

Or pick **Swirl** in Ly after copying the desktop file from `contrib/session/ly/`.

---

## Repository layout

```
.                      # full compositor source (Scroll → Sway lineage)
contrib/session/       # optional example configs, autotile, sway* shims
swirl.desktop          # wayland-sessions entry
TUTORIAL.md            # Scroll tutorial (layout commands still apply)
```

---

## Upstream

Swirl diverges from Scroll mainly by **rebranding and shipping as its own compositor** (`swirl*` binaries, `~/.config/swirl`, example session). Layout features from Scroll (overview, jump, spaces, trails, animations, …) remain available — see [TUTORIAL.md](./TUTORIAL.md). Some man page filenames still say `scroll`; the content applies.

- Based on [dawsers/scroll](https://github.com/dawsers/scroll) `1.12.17`

Please report Swirl-specific issues here; general scrolling-layout bugs may also belong upstream at Scroll.

---

## Credits

- [Scroll](https://github.com/dawsers/scroll) — scrolling layout compositor this fork is based on  
- [Sway](https://github.com/swaywm/sway) — i3-compatible Wayland compositor  
- [Niri](https://github.com/YaLTeR/niri) / [PaperWM](https://github.com/paperwm/PaperWM) — inspiration  

## License

MIT (same as Sway / Scroll). See [LICENSE](./LICENSE).
