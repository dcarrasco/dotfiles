# CLAUDE.md

This file guides Claude Code when working inside `new-debian/`. It supplements
(does not replace) the root `dotfiles/CLAUDE.md`.

## What this is

A from-scratch Debian bootstrap project. The goal is a single, repeatable
script (or small set of scripts) that takes a **minimal/basic Debian
install** (netinst, no desktop environment, nothing extra) and turns it into
this user's fully configured custom desktop: packages, a Hyprland/Wayland
desktop environment, and this dotfiles repo linked in via
`dotconfig/*` symlinks.

This supersedes the old `install/new-debian` script referenced in the root
CLAUDE.md — that file was moved here (`git status` shows it as a rename:
`D install/new-debian` / `?? new-debian/`) to become its own project instead
of living alongside the other legacy one-off installers in `install/`.

## Objective

Script the entire path from minimal Debian to daily-driver desktop, in
order, so a fresh install can be brought up unattended (or close to it):

1. System update
2. Base CLI packages (zsh, fzf, fd-find, zoxide, starship, tmux, fastfetch,
   trash-cli, btop, plus XDG dirs — note `git`/`neovim` are *not* installed
   here; `neovim` is pulled later as part of the desktop-environment step,
   and `git` isn't installed by the script at all since you need it already
   to have cloned this repo)
3. XDG dirs + symlinks into `dotconfig/*` (mirrors what
   `install-dotfiles`/`install/new-debian` did, but hardcoded here rather
   than fzf-picked), plus a `chsh` step that switches the login shell to
   zsh if it isn't already
4. Network/bluetooth stack (NetworkManager, firewalld, bluez)
5. Desktop environment: the script idempotently adds `trixie-backports` to
   `/etc/apt/sources.list` itself, then installs the Hyprland + Wayland
   stack, waybar, thunar, and rofi from it
6. Applications (currently just `firefox-esr`; expected to grow)

Anything added to the script should preserve this ordering: later steps
(desktop environment, apps) assume earlier steps (base packages, symlinks)
already ran.

## Running / checking the script

There's no test suite or build step — this is a single imperative bash
script meant to be run on a real (or disposable/VM) Debian install:

```sh
./new-debian/new-debian
```

It calls `sudo apt` repeatedly and is not safe to run against a system you
care about without reading it first. To check syntax/lint without a Debian
box, use `bash -n new-debian/new-debian` (parse-only) or `shellcheck
new-debian/new-debian` if shellcheck is installed — there's no shellcheck
config or CI wired up for this yet, it's just a plain sanity check.

## Current state

- The script now runs end-to-end (no early `exit`) — system update, CLI
  tools, symlinks, shell switch, network/bluetooth, desktop environment,
  and a (currently minimal) apps step all execute in order.
- Package installs and dir/symlink creation are idempotent by convention.
  Most lines use `[ -d "$X" ] || ln -s ...`; the XDG-dir/symlink block near
  the top uses `[ -d "$X" ] || { cmd && echo "..."; }` to log only when the
  command actually runs. **That grouping form requires a trailing `;`
  before the closing `}`** (`{ cmd && echo "msg"; }`) — omitting it is a
  silent syntax error that breaks the whole script and has been hit more
  than once; always run `bash -n new-debian/new-debian` after touching
  these lines.
- Uses `set -e`, and `print_info` / `print_success` / `print_error` helpers
  for colored status output. Follow this style for new sections rather than
  introducing a different logging approach. `print_error` and the
  `VINVERSE` color var are currently defined but unused — fine to use them
  for new error-path code rather than adding a parallel mechanism.
- `INSTALL_USERNAME` is a hardcoded var (`daniel`) near the top of the
  script, used only for the `chsh -s /bin/zsh $INSTALL_USERNAME` call — not
  derived from `$USER`, so it'll target the wrong account if this script is
  ever run to bootstrap a different user.
- Symlink targets assume the repo lives at `$HOME/dotfiles` — the script is
  meant to run after this dotfiles repo is already cloned there.

## Notes for future work

- Desktop environment packages are pinned to `trixie-backports`, and the
  script now self-manages the apt source for it (appends `deb`/`deb-src`
  lines to `/etc/apt/sources.list` if not already present, then `apt
  update`s before installing). Check whether the pin is still needed (vs.
  stable) when Debian trixie itself becomes stable/oldstable — dropping it
  means removing both the `-t trixie-backports` flag *and* the
  sources.list-append block, not just the flag.
- Keep this in sync conceptually with `ublue/install-hyprland.sh` (the
  Fedora/rpm-ostree equivalent) where the two overlap in intent, but don't
  try to unify them — they target fundamentally different package managers.
