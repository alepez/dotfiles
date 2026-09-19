# Agent instructions

This repository holds personal Arch Linux **Hyprland / Wayland** dotfiles.

## Model

- Clone path is `~/.dotfiles`.
- Files under `home/` are meant to be **manually symlinked** into `~` (see `tracked` and `./check`).
- Do **not** introduce stow, chezmoi, or other managers unless the user asks.
- Shared env is `env.sh`. Private secrets and env go in `~/.dotfiles-private` (never invent secrets here).

## Scripts: `bin/` vs `home/.local/bin/`

- **`bin/`** — every script lives here as a real file. Hyprland, greetd, keybinds, and other session plumbing call `~/.dotfiles/bin/...`. Not on `PATH` by itself.
- **`home/.local/bin/`** — **symlinks only** to `../../../bin/<name>`. This is the PATH export list (`env.sh` prepends `~/.local/bin`). Symlink into `~`, then run by name. Add new entries to [`tracked`](tracked).

| Put it in… | When |
|---|---|
| `bin/` only | Desktop/session helpers invoked by absolute path (`start-hyprland`, `wlockscreen`, `browser-default`, screenshots, dmenu plugins) |
| `bin/` + symlink in `home/.local/bin/` | Same script, also wanted as `cmd` on `PATH` |

Rule of thumb: source of truth → `bin/`; expose on `PATH` → symlink in `home/.local/bin/`.

## Session source of truth

- Window manager: [`home/.config/hypr/hyprland.lua`](home/.config/hypr/hyprland.lua)
- Bar: `home/.config/waybar/` (`monitor-profile`, `profiles/*.jsonc`, gitignored `config.jsonc` symlink)
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
| Status bar | waybar + `home/.config/waybar/profiles/` (`config.jsonc` symlink; `waybar-from-monitors` to snapshot outputs) |
| Monitors | `monitor-profile` + `home/.config/hypr/monitors/profiles/` (`current.lua` symlink; also selects the matching waybar profile) |

## Editing conventions

- Keep changes small and focused on the request.
- When adding or removing something under `home/`, update [`tracked`](tracked).
- Known migration work is listed in [`TODO.md`](TODO.md). Prefer fixing those over inventing parallel stacks.
- When completing a migration, remove the matching `TODO` comments in the file and the entry in `TODO.md`.

## Machine-local setup tutorials

When the user asks how to install or migrate a machine-local feature (docs under `docs/`, layouts under `~/.config/…` that are **not** in this repo):

1. Read the matching doc (e.g. [`docs/browser.md`](docs/browser.md)).
2. Inspect the **live** system: `~/.local/bin` overrides, existing symlinks, and any current `~/.config/…` state — do not invent profile/host names.
3. Produce a copy-pasteable tutorial that **replicates current behavior** with the new abstraction: PATH links from `home/.local/bin/`, create machine-local files, bind slots/selectors, then a short verify checklist.
4. Do **not** write those machine-local files from the agent unless the user explicitly asks to change files outside the repo. Prefer instructions; never commit personal/work profile names into the repo.
5. Call out leftovers (custom `~/.local/bin/…` files that must be replaced by tracked symlinks) and any required slots the user did not specify (e.g. `private`).
