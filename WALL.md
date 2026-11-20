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

## Resume checkpoint (2026-11-20)

### What we decided

- **Do not port renewm** into the default session. Renewm stays a separate lab
  (`sweetpotatos-update --renewm`) for reference.
- **Bring newm’s wall into Swirl** as an opt-in Settings/keybind toggle.
- v1 strip free-pan was a dead end (felt like “wall of stripes”). Replaced by
  real **2D grid + viewport pan + zoom**.

### What’s implemented (branch `wall-mode-v1`)

Swirl (`~/code/GITHUB/swirl`, pushed to `origin/wall-mode-v1`):

- `config->wall_mode` + cmds: `wall_mode`, `wall_pan`, `wall_zoom`
- Per-workspace `layout.wall { active, i, j, size }`
- Per-column `container.wall { i, j, w, h }`
- `layout_wall_enable/disable/apply/pan_*/zoom*` in `layout.c`
- Transaction path `arrange_workspace_wall` (skips strip arrange when wall on)
- Meson icon fix: `assets/Swirl.png` → install as `swirl.png`

SweetPotato + SPO skel:

- `wall-mode.sh`, Settings switch, binds, cheatsheet
- Lab install: `sweetpotatos-update --wall` → `sweetpotatos-wall`
  (pulls branch, meson build to `/usr`, syncs desktop bits)
- Docs: `packaging/wall/README.md`

### How to update on the SPO laptop

```bash
git -C ~/code/GITHUB/SweetPotatOs pull
rm -rf ~/code/GITHUB/swirl/build-wall
~/code/GITHUB/SweetPotatOs/packaging/sweetpotatos/sweetpotatos-update --wall
# then log out / in
```

### Likely next work

- Try on laptop; fix packing/zoom/gesture feel vs renewm reference
- Stacked windows inside a tile (multi-view columns) may need polish
- New windows while wall is on: grid reassigns on apply — watch edge cases
- Optional: 4-finger zoom gesture like newm; don’t replace overview yet
- When stable: merge `wall-mode-v1` → swirl package / channel (not done)
