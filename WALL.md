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

## Resume checkpoint (2026-11-21, scale pass)

### What we decided

- **Do not port renewm** into the default session. Renewm stays a separate lab
  (`sweetpotatos-update --renewm`) for reference.
- **Bring newm’s wall into Swirl** as an opt-in Settings/keybind toggle.
- Shrinking client boxes for zoom was a dead end (apps look crushed /
  unusable). Zoom must be **compositor scale**, like overview / newm.

### What’s implemented (branch `wall-mode-v1`)

- 2D leaf grid + viewport pan/zoom cmds
- **Full logical tile size** + `workspace->scale = 1/size` (overview model)
- `arrange_workspace_wall` → `animate_view` per leaf; columns hidden
- Wall enable forces `LAYER_SHELL_ALL` so swirlbar chrome stays up
- Disable restores `mem_scale` and re-enables layer shell

### How to update on the SPO laptop

```bash
rm -rf ~/code/GITHUB/swirl/build-wall
~/code/GITHUB/SweetPotatOs/packaging/sweetpotatos/sweetpotatos-update --wall
# log out / in
# if bar border missing after sync: ~/.config/swirl/scripts/frame.sh on
```

### Likely next work

- Feel vs renewm (pan inertia, zoom steps, focus raise)
- Stable tile positions when windows open/close (stop full re-pack every apply)
- Optional: 4-finger zoom; don’t replace overview yet
