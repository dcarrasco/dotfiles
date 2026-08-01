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
2. Base CLI packages (git, neovim, zsh, shell tooling)
3. XDG dirs + symlinks into `dotconfig/*` (mirrors what
   `install-dotfiles`/`install/new-debian` did, but hardcoded here rather
   than fzf-picked)
4. Network/bluetooth stack (NetworkManager, firewalld, bluez)
5. Desktop environment (Hyprland + Wayland stack, currently pulled from
   `trixie-backports`)
6. Applications (in progress — this section is unfinished, see below)

Anything added to the script should preserve this ordering: later steps
(desktop environment, apps) assume earlier steps (base packages, symlinks)
already ran.

## Current state

- `new-debian` (the script itself) currently ends mid-"install apps" section
  — treat that as the active TODO, not a finished step.
- Package installs and dir/symlink creation are idempotent by convention
  (`[ -d "$X" ] || mkdir/ln -s ...`). Keep new steps idempotent the same way
  so the script is safe to re-run after a failure partway through.
- Uses `set -e`, and `print_info` / `print_success` / `print_error` helpers
  for colored status output. Follow this style for new sections rather than
  introducing a different logging approach.
- Symlink targets assume the repo lives at `$HOME/dotfiles` — the script is
  meant to run after this dotfiles repo is already cloned there.

## Notes for future work

- Desktop environment packages are pinned to `trixie-backports` — check
  whether that's still needed (vs. stable) when Debian trixie itself becomes
  stable/oldstable.
- Keep this in sync conceptually with `ublue/install-hyprland.sh` (the
  Fedora/rpm-ostree equivalent) where the two overlap in intent, but don't
  try to unify them — they target fundamentally different package managers.
