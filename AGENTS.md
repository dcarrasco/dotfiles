# AGENTS.md

## Repository overview

This repository contains personal Linux dotfiles and bootstrap scripts. It supports several desktop stacks and machines rather than one uniform installation:

- Wayland: Hyprland and Sway, with Waybar/Rofi/Mako or the alternate Noctalia/Quickshell shell.
- X11: i3 and bspwm, with Polybar, sxhkd, and Picom.
- Shared configuration: Zsh, Neovim, tmux, Kitty, Alacritty, and other CLI/desktop tools under `dotconfig/`.
- Platforms: Debian bootstrap work in `new-debian/`, Fedora Atomic/Bazzite scripts in `ublue/`, and an unimplemented traditional Fedora plan in `reinstall-fedora/`.

There is no build system, CI pipeline, or single authoritative installer. Treat these as live machine configuration files and validate only the area changed.

## Important paths

- `install-dotfiles`: primary interactive installer. It links `dotconfig/<name>` to `$XDG_CONFIG_HOME/<name>` and backs up an existing real directory to `<name>.bak`. When adding a new folder under `dotconfig/`, also add it to `DOTCONFIGS` here.
- `new-debian/new-debian`: current Debian/Trixie bootstrap. Read `new-debian/CLAUDE.md` before changing it.
- `install-new` and `install/install-*`: older Debian installers retained as legacy/reference; do not assume they match current configuration.
- `ublue/`: Fedora Atomic/rpm-ostree setup. Do not apply its package-management assumptions to traditional Fedora.
- `reinstall-fedora/`: currently planning/reference material only. Read its `CLAUDE.md` before adding automation.
- `dotconfig/noctalia-shell`: a pinned gitlink, not ordinary vendored source. The repository has no `.gitmodules` entry, so avoid editing or replacing it casually.

## Editing conventions

- Follow `.editorconfig`: UTF-8, LF, final newline, four-space indentation by default, two spaces for Lua and YAML, and tabs in Makefiles.
- Preserve the language and style already used in each file; several scripts and messages are in Spanish.
- Do not change hardcoded machine paths or package choices merely to make them generic unless requested. Many scripts intentionally assume this repository is at `$HOME/dotfiles`.
- Keep changes scoped. Configurations for different distributions and window managers coexist intentionally and can drift because they target different machines.
- Before editing a generated-looking live theme file, look for a matching `.orig` template and the script that regenerates it.

## Hyprland configuration

Hyprland has two manually synchronized representations:

- Active source: `dotconfig/hypr/hyprland.lua` and `dotconfig/hypr/lua/*.lua`.
- Native mirror: `dotconfig/hypr/conf/hyprland.conf` and `dotconfig/hypr/conf/*.conf`.

For behavior changes, update Lua first and port the same change to the corresponding `.conf` file. The mirrored areas include `autostart`, `envs`, `input`, `keybinds`, `looknfeel`, `monitors`, `rules`, and `theme`.

`dotconfig/hypr/scripts/hypr-sys-menu` is a self-contained Rofi script-mode menu. Keep `MENU_TITLES`, `MENU_PARENTS`, `render()`, and `run_action()` consistent when adding or removing menus/actions. Use `selectable_entry()` for choices with a current value; it marks the active choice with the filled radio glyph (``) and other choices with the empty glyph (``). Programs spawned by actions use `exec_pgm()` so Rofi can exit without blocking.

Rofi's `normal` and `alternate` element states reflect alternating row positions, independently of states such as `selected`, `active`, or `urgent`. When styling a semantic state in `dotconfig/rofi/themes/default.rasi`, use a selector that covers both row variants (for example, `element active`) unless the variants intentionally need different styling.

## Themes and generated files

Two separate Hyprland scripts affect different concepts:

- `hypr-switch-colors` / `hypr-generate-themes` select color schemes from `dotconfig/hypr/themes/` and regenerate Hyprland, Waybar, and Rofi color files from `.orig` templates.
- `hypr-switch-theme` changes only the Waybar layout using `dotconfig/waybar/themes/<layout>/`.

The following local/generated paths are ignored by Git and should normally be changed through their template, source theme, or generator instead:

- `dotconfig/zsh/plugins/`
- `dotconfig/kitty/theme.conf`
- `dotconfig/alacritty/theme.toml`
- `dotconfig/hypr/hyprpaper.conf`
- `dotconfig/hypr/conf/theme.conf`
- `dotconfig/hypr/lua/theme.lua`
- `dotconfig/waybar/theme.jsonc`, `theme.css`, and `colors.css`
- `dotconfig/rofi/themes/colors.rasi`

## Zsh and desktop-shell notes

- Zsh configuration is split across focused files in `dotconfig/zsh/`. `plugins.zsh` clones plugins on first load into the ignored `dotconfig/zsh/plugins/` directory; there is no plugin manager lockfile.
- Noctalia consists of the pinned `dotconfig/noctalia-shell` code, user data in `dotconfig/noctalia/`, and the entry point `dotconfig/quickshell/shell.qml`.
- Hyprland autostart does not establish whether Waybar or Noctalia is active. Several services are expected to be launched by user systemd units outside this repository.

## Validation

Run checks that fit the files touched; do not execute installation/bootstrap scripts on the host as a test.

- Shell scripts: `bash -n <script>` when Bash is required, otherwise use the interpreter from the shebang. Run `shellcheck <script>` when available.
- Lua: use `luac -p <file>` when available, while remembering that Hyprland helper globals may prevent meaningful runtime execution outside Hyprland.
- JSON/JSONC/QML and application configs: prefer the owning application's parse/check command if installed; do not rewrite JSONC with a strict JSON formatter.
- Debian bootstrap: always run `bash -n new-debian/new-debian` after edits. Its grouped commands require a semicolon before `}`.
- Review `git diff --check` and `git status --short` before finishing. Generated ignored files will not appear in status.

Scripts that invoke `sudo`, `apt`, `dnf`, `rpm-ostree`, change the login shell, replace symlinks, or restart desktop components can alter the live system. Read them first and use syntax/static checks unless the user explicitly asks for execution.
