# Browser profiles

Abstract launchers live in this repo (`browser-default`, `browser-private-default`,
`browser-profile`). What they run is **machine-local** and must not be committed here.

## Layout

Create this on each system:

```
~/.config/browser/profiles/<name>   # executable launchers
~/.config/browser/default           # symlink → profiles/<name>
~/.config/browser/private           # symlink → profiles/<name>
```

`default` and `private` are reserved **slot** names. Profile names (e.g. personal,
work) stay on the machine only.

## Define a profile

Each file under `profiles/` is an executable that launches a browser. Pass through
`"$@"` so URLs and flags work.

Firefox with a named profile (helper: link `firefox-<name>` → `bin/firefox-profile`):

```sh
#!/usr/bin/env bash
exec ~/.local/bin/firefox-NAME "$@"
```

Or call Firefox directly:

```sh
#!/usr/bin/env bash
exec firefox -p NAME "$@"
```

Chromium with a named profile (helper: link `chromium-<name>` → `bin/chromium-profile`):

```sh
#!/usr/bin/env bash
exec ~/.local/bin/chromium-NAME "$@"
```

Private / ephemeral window (repo helper):

```sh
#!/usr/bin/env bash
exec ~/.dotfiles/bin/firefox-private "$@"
```

Or Firefox private window on an existing profile:

```sh
#!/usr/bin/env bash
exec firefox -p NAME --private-window "$@"
```

Make them executable:

```sh
chmod +x ~/.config/browser/profiles/*
```

## Bind and launch

```sh
browser-profile                 # list profiles; mark default / private
browser-profile NAME            # launch profiles/NAME
browser-profile default NAME    # bind default slot → profiles/NAME
browser-profile private NAME    # bind private slot → profiles/NAME
browser-default                 # launch the default slot
browser-private-default         # launch the private slot
```

Hyprland uses `~/.dotfiles/bin/browser-default` and
`~/.dotfiles/bin/browser-private-default` (Super+b / Super+Shift+b).
`browser.desktop` uses `browser-default`.

## PATH

Symlink from `home/.local/bin/` (tracked):

- `browser-profile`
- `browser-default`
- `browser-private-default`

After linking into `~/.local/bin`, you can run them by name. If a machine still has
a custom `~/.local/bin/browser-default` file, replace it with the tracked symlink so
the slot system is used.

## Agent note

When asked how to set this up on a machine, follow the **Machine-local setup tutorials**
section in [`AGENTS.md`](../AGENTS.md): inspect live `~/.local/bin` / browser launchers,
then give concrete steps that preserve current default/private behavior without
committing profile names here.
