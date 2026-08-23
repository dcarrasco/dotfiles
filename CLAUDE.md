# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal dotfiles for a Linux desktop environment, supporting two parallel window-manager stacks (Wayland/Hyprland+Sway and X11/i3+bspwm) plus shared shell/editor/terminal config. Deployed across at least three distinct targets: a Debian machine, a Universal Blue/Bazzite (Fedora atomic, rpm-ostree) machine, and generic installs via `install-dotfiles`.

## Installing / linking config

- **Primary installer**: `./install-dotfiles [name]` — symlinks a folder from `dotconfig/<name>` into `$XDG_CONFIG_HOME`. Without an argument it opens an `fzf` picker over the `DOTCONFIGS` list defined at the top of the script; existing real directories at the target are backed up to `<name>.bak` before the symlink is created. **When adding a new dotconfig folder, add its name to the `DOTCONFIGS` variable in `install-dotfiles`** or the installer won't recognize it.
- **`install-new`**: legacy Debian bootstrap — installs base packages, oh-my-zsh, neovim (packer), then symlinks a *different*, smaller set of top-level files. Not kept in sync with `install-dotfiles`.
- **`install/install-neovim`, `install/install-zsh`**: older, narrower per-tool Debian installers (Vundle-based neovim setup, distinct from the current neovim config). Treat as legacy/reference, not the current path.
- **`install/new-debian`**: newer, more complete Debian/trixie bootstrap (apt packages, hyprland via trixie-backports, hardcoded symlinks for a specific subset of `dotconfig/*`).
- **`ublue/install-hyprland.sh`**: Fedora atomic (rpm-ostree) equivalent — installs Hyprland stack via `rpm-ostree install` from a Copr repo; the dotconfig symlink lines are commented out (done separately via `install-dotfiles`).
- **`ublue/distrobox-fedora-packages.sh`**: package list for a distrobox container on the ublue host.

There is no single authoritative installer — the scripts target different distros/points in time. When editing install behavior, check which script is relevant to the platform in question rather than assuming one covers all.

## Hyprland config: dual conf/lua system

`dotconfig/hypr/` has **two parallel, hand-synced configuration formats** for the same settings:

- `dotconfig/hypr/hyprland.lua` + `dotconfig/hypr/lua/*.lua` — the **actively maintained** config (most recent commits touch this tree first).
- `dotconfig/hypr/conf/hyprland.conf` + `dotconfig/hypr/conf/*.conf` — the native Hyprlang format, kept in sync with the lua version via manual "Sync hypr conf files with lua config" commits.

Both trees mirror the same filenames (`theme`, `rules`, `keybinds`, `monitors`, `envs`, `autostart`, `input`, `looknfeel`). **When changing Hyprland behavior, update the `.lua` version first** (that's where new commits land), then port the change to the matching `.conf` file so the two don't drift.

`dotconfig/hypr/scripts/` holds standalone shell scripts invoked from keybinds/waybar (e.g. `hypr-sys-menu`, `hypr-switch-wallpaper`). Two of them are easy to confuse — see the color-scheme pipeline below vs. `hypr-switch-theme` (waybar layout) in the next section. `hypr-sys-menu` has its own architecture, documented next.

## System menu: `hypr-sys-menu` (rofi script mode)

`dotconfig/hypr/scripts/hypr-sys-menu` is a single self-contained rofi **script mode** (custom `modi`), not a chain of blocking dmenu calls. Run with no args (or from a keybind), it calls `load_rofi()`, which launches `rofi -show sysmenu -modes "sysmenu:$SELF"` — rofi then re-invokes this same script on every keystroke/selection with `ROFI_RETV`/`ROFI_INFO` env vars set, and the script dispatches based on those:

- `render()` prints one menu's entries (each via `entry()`, encoding a `menu:<name>` or `act:<name>` target in rofi's `info` field) — this is what draws a submenu like `style`, `toggle`, `power_management`, etc.
- `run_action()` executes a leaf `act:<name>`.
- `title_menu()` supplies the header text for each menu name — every `menu:x` in `render()` needs a matching case here too.

Programs launched from an action go through `exec_pgm()` (a `coproc "$@" > /dev/null; exit 0` wrapper) so the script can exit immediately and rofi doesn't block waiting on the spawned process. When editing this script, keep `render()`/`run_action()`/`title_menu()`'s case statements in sync with each other — adding a menu entry means touching up to three places.

This replaced an older design of nested `show_*_menu` shell functions that each called an external `hypr-sys-show-menu` helper and recursed on the result; that helper and pattern are no longer the current path.

## Noctalia shell (Quickshell) — alternate desktop shell stack

Three dotconfig folders together make up a second, parallel bar/shell stack alongside waybar+rofi+mako, built on [Noctalia](https://github.com/noctalia-dev/noctalia-shell) (a Quickshell/Qt-QML Wayland shell: bar, app launcher, notifications, lock screen, OSD, etc.):

- `dotconfig/noctalia-shell` is the vendored upstream project itself, tracked in git as a **gitlink** (`git ls-tree` shows mode `160000`, pinned commit) — but **there is no `.gitmodules` entry for it**, so `git submodule` commands don't recognize it and a fresh clone gets an empty directory here. Populating it (e.g. cloning `noctalia-dev/noctalia-shell` at the pinned commit into place) isn't automated by any install script currently.
- `dotconfig/noctalia/` is the hand-maintained user config/data for it (`colorschemes/`, `colors.json`, `plugins.json`, `settings.json`) — separate from the vendored code above.
- `dotconfig/quickshell/shell.qml` is the actual entry point the `quickshell` binary loads; it just imports modules from the noctalia-shell tree (`qs.Commons`, `qs.Modules.*`, where `qs` resolves into `noctalia-shell`).

Waybar (like `hypridle`, `hyprpaper`, `mako`, `hyprpolkitagent`) is **not** started from Hyprland's autostart — `dotconfig/hypr/lua/autostart.lua` / `conf/autostart.conf` have those `exec-once` lines commented out with a note that "those processes are being started by systemd" (a user systemd service outside this repo). The same file also has a commented-out `hl.exec_cmd("qs")` (quickshell) line, so autostart.lua alone doesn't indicate whether waybar or noctalia-shell is the one actually running — check the user's systemd units (`systemctl --user status`) for that.

## Theming pattern (repeats across waybar, hypr, rofi, alacritty, kitty)

Several tools use the same convention: a live `theme.*` file (e.g. `waybar/theme.css`, `waybar/theme.jsonc`) that gets overwritten/regenerated, alongside a `theme.*.orig` template it's regenerated from, plus a `themes/` or `colors/` subdirectory holding the actual per-theme variants that get switched between. Don't edit `theme.*` files directly expecting persistence — check for a `.orig` counterpart and a switcher script first.

There are two independent, same-named-sounding "theme" switchers — don't conflate them:

- **Color scheme** (Nord, Dracula, Catppuccin, Catppuccin-Latte, Nord-Frost): `dotconfig/hypr/scripts/hypr-switch-colors` calls `hypr-generate-themes <name>`, which `source`s a master color-definition file at `dotconfig/hypr/themes/<name>` (a plain shell script defining `THEME_*` variables — window borders, bar bg, accents, etc., no file extension) and `sed`-stamps those values into four separately gitignored generated files, each first seeded from its `.orig` template: `dotconfig/hypr/lua/theme.lua`, `dotconfig/hypr/conf/theme.conf`, `dotconfig/waybar/colors.css`, `dotconfig/rofi/themes/colors.rasi`.
- **Bar layout** (Square, Circle, Underscore, Mac, Float, Tahoe, KDE): `dotconfig/hypr/scripts/hypr-switch-theme` rewrites `dotconfig/waybar/theme.css` + `theme.jsonc` via `sed` to import from `dotconfig/waybar/themes/<layout>/style.css` and `layout.jsonc`. This only affects waybar's layout, not colors.

## zsh structure

`dotconfig/zsh/` is split into purpose-specific files sourced from the main zsh entrypoint: `aliases.zsh`, `bindings.zsh`, `prompt.zsh`, `fzf.zsh`, `tmux.zsh`, `plugins.zsh`. Plugins are not vendored — `plugins.zsh` git-clones them on first load into `dotconfig/zsh/plugins/` (gitignored) and sources them from there; there's no package manager (no zinit/zplug), just a small `_zplugin_load` clone-and-source helper.

## Gitignored generated/local files

`.gitignore` excludes machine- or theme-specific generated files that are regenerated by scripts rather than hand-edited: `dotconfig/zsh/plugins`, `dotconfig/kitty/theme.conf`, `dotconfig/alacritty/theme.toml`, `dotconfig/hypr/hyprpaper.conf`, `dotconfig/waybar/theme.{jsonc,css}`, `dotconfig/waybar/colors.css`, `dotconfig/hypr/conf/theme.conf`, `dotconfig/hypr/lua/theme.lua`, `dotconfig/rofi/themes/colors.rasi`. If a change to one of these isn't showing up in `git status`, that's expected — edit the source/template or switcher script instead.
