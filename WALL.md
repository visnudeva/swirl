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
