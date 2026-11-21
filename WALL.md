# Wall mode

Inspired by newm: windows (columns) live on a **2D tile grid**; the screen is a
viewport you pan and zoom.

## Behaviour

- **Toggle:** `wall_mode enable|disable|toggle` (Settings → Desktop → Wall;
  SweetPotato: `Mod+Ctrl+Shift+w` / `wall-mode.sh`)
- **On enable:** pack top-level columns into a square grid and zoom out so the
  whole wall is visible (newm overview feel).
- **Pan:** `wall_pan left|right|up|down` (SweetPotato: `Mod+Alt+arrows`) and
  three-finger swipe — moves the viewport in tile space.
- **Zoom:** `wall_zoom in|out|exact <n>` (SweetPotato: `Mod+Alt+u` / `Mod+Alt+n`)
  — `size=1` is one tile filling the screen; larger sizes show more tiles.
- **Off:** normal Swirl strip scrolling.

## Non-goals (for now)

- Replacing overview / coverflow workspaces  
- Porting pywm/renewm code  
- Changing the default session (Swirl stays default)

---

## Resume checkpoint (2026-11-21, usable focus)

### What we decided

- Wall must be **usable for work**: enable lands on focused tile at `size=1`.
- Mod+Tab while wall is on = **fit ↔ focus** (not multi-workspace overview).
- Compositor scale for zoom; renewm stays a feel lab only.

### What’s implemented (branch `wall-mode-v1`)

- Full-size tiles + `scale = 1/size`
- `layout_wall_overview_toggle` / `wall_zoom toggle`
- `scale_workspaces` + classic overview redirect to wall toggle when wall on
- Zoom binds: Mod+Alt+u/n, Mod+Alt+Return; inject upgrades older pan-only configs
- frame.sh re-applied after wall toggle (bar border)

### How to update on the SPO laptop

```bash
rm -rf ~/code/GITHUB/swirl/build-wall
~/code/GITHUB/SweetPotatOs/packaging/sweetpotatos/sweetpotatos-update --wall
# log out / in
# if bar still flush: ~/.config/swirl/scripts/frame.sh on
```

### 2026-11-21 follow-up (invisible / half-size)

- New windows while fit-zoomed were packing outside the viewport → treat as
  invisible; fit mode now grows with the grid, and new windows in focus mode
  dive to size=1 at full tile (`width_fraction=1`)
- Stop disabling column scene nodes (new children could stay hidden)
- Strip 50% defaults are forced to full-tile on wall place

### Likely next work

- Click-to-focus while zoomed out centers/dives to that tile
- Stable tile indices when windows open/close
- Optional: 4-finger zoom
