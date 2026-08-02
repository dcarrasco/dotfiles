# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

An empty, not-yet-implemented directory in the larger dotfiles repo (`/home/daniel/dotfiles/`), intended to hold a bootstrap script for reinstalling **traditional Fedora Workstation** (regular `dnf`), as opposed to Fedora Atomic/Bazzite (rpm-ostree), which is handled separately under `../ublue/`.

## Current state

The only content is `README`, a short checklist capturing intent, not instructions:

```
Reinstall fedora:

Check all the packages manually installed
Check all the flathub packages installed
```

No script, package list, or automation exists here yet. There is nothing to build, lint, or run.

## Relationship to the rest of the repo

- `../ublue/install-hyprland.sh` and `../ublue/distrobox-fedora-packages.sh` target Fedora **Atomic** (rpm-ostree) — do not conflate that with this directory's traditional-Fedora scope.
- `../new-debian/` is the closest analog elsewhere in the repo: a from-scratch distro bootstrap (`new-debian/new-debian`) structured as a single imperative bash script with ordered numbered steps, idempotent `[ -d ... ] ||` guards, and `print_info`/`print_success`/`print_error` logging helpers, plus its own `CLAUDE.md` and `manual.md`. If a `reinstall-fedora` bootstrap script is written, following that same pattern (adapted for `dnf`/Flatpak instead of `apt`) would keep it consistent with the rest of the repo — but that work has not started.
