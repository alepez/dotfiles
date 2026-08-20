# Agent instructions

This repository holds personal Arch Linux **Hyprland / Wayland** dotfiles.

## Model

- Clone path is `~/.dotfiles`.
- Files under `home/` are meant to be **manually symlinked** into `~` (see `tracked` and `./check`).
- Do **not** introduce stow, chezmoi, or other managers unless the user asks.
- Shared env is `env.sh`. Private secrets and env go in `~/.dotfiles-private` (never invent secrets here).

## Scripts: `bin/` vs `home/.local/bin/`

- **`bin/`** — repo-owned scripts, usually called by full path (`~/.dotfiles/bin/...`). Hyprland, greetd, keybinds, and other session plumbing use this. Not on `PATH` by itself.
- **`home/.local/bin/`** — what ends up on `PATH` (`env.sh` prepends `~/.local/bin`). Symlink into `~`, then run by name in a shell. Add new entries to [`tracked`](tracked).

| Put it in… | When |
|---|---|
| `bin/` only | Desktop/session helpers invoked by absolute path (`start-hyprland`, `wlockscreen`, `browser-default`, screenshots, dmenu plugins) |
| `bin/` + symlink in `home/.local/bin/` | Same script, also wanted as `cmd` on `PATH` (most overlaps are this) |
| `home/.local/bin/` only | Everyday CLI tools meant to be typed (`mv-to-date-dir`, `re-video`, …) |

Rule of thumb: source of truth for shared/desktop scripts → `bin/`; expose on `PATH` → `home/.local/bin` (file or symlink to `../../../bin/...`).

## Session source of truth

- Window manager: [`home/.config/hypr/hyprland.lua`](home/.config/hypr/hyprland.lua)
- Bar: `home/.config/waybar/`
- Lock / idle: `hyprlock.conf`, `hypridle.conf`
- Wallpaper: `home/.config/wpaperd/` (not hyprpaper)

## Wayland-only policy

Do **not** reintroduce X11 / i3 tooling, including:

`xclip`, `xrandr`, `xset`, `xmodmap`, `setxkbmap`, `xcape`, `xbindkeys`, `picom`, `polybar`, `autorandr`, `feh`, `flameshot`, `betterlockscreen`, `xss-lock`, `i3-msg`, gpaste (X-era clipboard manager)

Prefer:

| Role | Tools |
|------|--------|
| Clipboard | `wl-copy` / `wl-paste`, cliphist |
| Screenshots | grim, slurp, swappy |
| Lock | hyprlock + hypridle + `bin/wlockscreen` |
| Wallpaper | wpaperd |
| Status bar | waybar |
| Monitors | `hypr-monitor` + `home/.config/hypr/monitors/` |

## Editing conventions

- Keep changes small and focused on the request.
- When adding or removing something under `home/`, update [`tracked`](tracked).
- Known migration work is listed in [`TODO.md`](TODO.md). Prefer fixing those over inventing parallel stacks.
- When completing a migration, remove the matching `TODO` comments in the file and the entry in `TODO.md`.
