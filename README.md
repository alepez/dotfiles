# Alessandro Pezzato dotfiles

Personal Arch Linux dotfiles for **Hyprland on Wayland**.

X11 / i3 is deprecated and removed. See [TODO.md](TODO.md) for migration gaps and [AGENTS.md](AGENTS.md) for agent instructions.

## Layout

| Path | Role |
|------|------|
| `home/` | Files symlinked into `~` |
| `bin/` | Scripts often called as `~/.dotfiles/bin/...` (not on `PATH` by itself) |
| `home/.local/bin/` | Scripts/symlinks that land on `PATH` via `~/.local/bin` (`env.sh`) |
| `actions/` | Rofi/dmenu action plugins |
| `more/` | Optional extras (zsh snippets, tmux, themes) |
| `root/` | System-wide configs (e.g. greetd) |
| `env.sh` | Shared environment (sourced by shell profiles) |
| `tracked` | Manifest of home paths that should be linked |
| `check` | Interactive consistency checker for `tracked` |

Optional private overlay: `~/.dotfiles-private` (sourced from `env.sh`).

### Scripts: `bin/` vs `home/.local/bin/`

- **`bin/`** — desktop/session helpers invoked by absolute path (Hyprland, greetd, keybinds). Examples: `start-hyprland`, `wlockscreen`, `browser-default`.
- **`home/.local/bin/`** — everyday CLI tools on `PATH`, or symlinks into `bin/` when the same script should also be runnable by name.

| Put it in… | When |
|---|---|
| `bin/` only | Session/desktop plumbing, absolute-path calls |
| `bin/` + symlink in `home/.local/bin/` | Shared script also wanted on `PATH` |
| `home/.local/bin/` only | Interactive CLIs typed in a shell |

New files under `home/` must be listed in `tracked`.

## Active desktop stack

Hyprland (Lua) · waybar · hypridle / hyprlock · wpaperd · grim / slurp / swappy · cliphist / wl-clipboard · rofi

Login: greetd → `bin/start-hyprland`.

## Setup

Clone into your home directory:

```sh
git clone https://github.com/alepez/dotfiles.git ~/.dotfiles
```

Symlink what you need from `home/` into `~`:

```sh
ln -nfs ~/.dotfiles/home/.zshrc ~/.zshrc
```

Use `tracked` as the list of expected links. Check consistency:

```sh
./check
```

Copy or link system configs from `root/` as needed (e.g. `root/etc/greetd/config.toml`).
