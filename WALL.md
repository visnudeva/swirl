# Wall mode (v1)

Inspired by newm’s wall: windows live on a plane larger than the screen; you
move the viewport instead of only flipping workspaces.

## v1 (this work)

- **Toggle:** `wall_mode enable|disable|toggle` (Settings → Desktop → Wall;
  SweetPotato: `Mod+Ctrl+Shift+w` / `wall-mode.sh`)
- **Pan keys:** `wall_pan left|right|up|down` (SweetPotato: `Mod+Alt+arrows`)
- **Behaviour when on:** free **2D pan** of the current workspace strip
  (gesture swipe and `wall_pan` keys). No zoom. Focus/overview unchanged.
- **Behaviour when off:** current Swirl scrolling (primary axis only).

## Later

- v2: place windows on a real 2D grid  
- v3: zoom (newm-style scale)

## Non-goals for v1

- Replacing overview  
- Porting pywm/renewm code  
- Changing the default session (Swirl stays default)
