## Files

| Config | Syntax | Path | System Path | Purpose | Link |
| ------ | ------ | ---- | ----------- | ------- | ---- |
| boxes | boxes | `boxes/` | `~/.config/boxes/` | custom box design | [boxes](https://github.com/ascii-boxes/boxes) |
| dunst | cfg | `dunst/` | `~/.config/dunst/` | notification daemon | [dunst](https://github.com/dunst-project/dunst) |
| galculator | conf | `galculator/` | `~/.config/galculator/` | simple gtk calculator | [galculator](http://galculator.mnim.org/)
| gtk-2.0 | gtkrc | `gtk-2.0/` | `~` | gtk2 | [GTK](https://www.gtk.org/) |
| gtk-3.0 | css, dosini | `gtk-3.0/` | `~/.config/gtk-3.0/` | gtk3 | [GTK](https://www.gtk.org/) |
| kvantum | - | `kvantum/` | `~/.config/Kvantum/` | Qt theme manager | [kvantum](https://store.kde.org/p/1005410) |
| nvim | lua, toml | `nvim/` | `~/.config/nvim/` | editor | [neovim](https://neovim.io/) |
| nwg-bar | json, css | `nwg-bar/` | `~/.config/nwg-bar/` | gtk3 button bar | [nwg-bar](https://github.com/nwg-piotr/nwg-bar) |
| sway | swayconfig | `sway/` | `~/.config/sway/` | wayland WM based on i3 | [sway](https://swaywm.org/) |
| tofi | conf | `tofi/` | `~/.config/tofi/` | wayland launcher menu | [tofi](https://github.com/philj56/tofi) |
| vifm | vifm | `vifm/` | `~/.config/vifm/` | terminal file manager with vi-like bindings | [vifm](https://vifm.info/) |
| waybar | jsonc, css | `waybar/` | `~/.config/waybar/` | wayland status bar | [waybar](https://github.com/Alexays/Waybar) |
| xsettingsd | conf | `xsettingsd/` | `~/.config/xsettingsd/` | X settings daemon for XWayland | [xsettingsd](https://wiki.archlinux.org/title/Xsettingsd) |
| zenity | bash | `zenity/` | `~/.config/zenity/` | wayland-compatible password prompt (`sudo -A`) | [zenity](https://help.gnome.org/users/zenity/stable/) |
| zsh | zsh | `zsh` | `~` | shell | [zsh](https://zsh.sourceforge.io/) |
| foot | dosini | `foot` | `~/.config/foot/` | wayland terminal emulator | [foot](https://codeberg.org/dnkl/foot) |

## Themes

| Type | Theme | URL |
| ---- | ----- | --- |
| GTK Theme | Gruvbox-Material-Dark-HIDPI | [](https://github.com/TheGreatMcPain/gruvbox-material-gtk) |
| GTK Cursors | Simple-Gruvbox-Dark | [](https://www.pling.com/p/1932768/) |
| GTK Icons | Gruvbox Plus Dark | [](https://www.gnome-look.org/s/Gnome/p/1961046) |
| GUI Font | AnonymicePro Nerd Font | [](https://www.nerdfonts.com/) |
| Terminal Font | Terminess Nerd Font | [](https://www.nerdfonts.com/) |
| Qt/Kvantum Theme | Gruvbox-Dark-Brown | [](https://store.kde.org/p/1976481) |
| Neovim Colorscheme | gruvbox.nvim | [](https://github.com/ellisonleao/gruvbox.nvim) |
| Vifm Colorscheme | gruvbox | [](https://github.com/vifm/vifm-colors/blob/master/gruvbox.vifm) |
| foot Theme | gruvbox | built-in |

## Neovim Plugins

Plugins are managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

| Plugin | Use | Spec Path | Repo |
| ------ | --- | --------- | ---- |
| gruvbox.nvim | colorscheme | `nvim/lua/plugins/colorscheme.lua` | ellisonleao/gruvbox.nvim |
| plenary.nvim | lua API *(unused)* | `nvim/lua/plugins/util.lua` | nvim-lua/plenary.nvim |
| marks.nvim | marks in signcolumn | `nvim/lua/plugins/ui.lua` | chentoast/marks.nvim |
| nvim-tree | netrw-like file explorer | `nvim/lua/plugins/editor.lua` | nvim-tree/nvim-tree.lua |
| nvim-web-devicons | icons for nvim-tree | `nvim/lua/plugins/editor.lua` | nvim-tree/nvim-web-devicons |
| indent-blankline.nvim | scope/indentation guides | `nvim/lua/plugins/ui.lua` | lukas-reineke/indent-blankline.nvim |
| gitsigns.nvim | git indicators/blame line | `nvim/lua/plugins/ui.lua` | lewis6991/gitsigns.nvim |
| nvim-treesitter | highlighting/indentation/folding | `nvim/lua/plugins/coding.lua` | nvim-treesitter/nvim-treesitter |
| nvim-ts-autotag | auto close/rename HTML tags | `nvim/lua/plugins/coding.lua` | windwp/nvim-ts-autotag |
| nvim-lspconfig | lsp configs | `nvim/lua/plugins/coding.lua` | neovim/nvim-lspconfig |
| conform.nvim | code formatter | `nvim/lua/plugins/coding.lua` | stevearc/conform.nvim |

## Tools

| Tool | License | Use | Link |
| ---- | ------- | --- | ---- |
| nwg-look | free | graphical GTK configurator | [](https://github.com/nwg-piotr/nwg-look) |
| kvantum | free | Qt theme engine/configurator | [](https://store.kde.org/p/1005410) |
| wev | free | xev-like wayland event viewer | [](https://github.com/jwrdegoede/wev) |
| solaar | free | logitech device manager | [](https://github.com/pwr-Solaar/Solaar) |
| insync | paid | google drive/dropbox sync | [](https://www.insynchq.com/) |
| udiskie | free | automount removable media | [](https://github.com/coldfix/udiskie) |
| fastfetch | free | system information fetcher | [](https://github.com/fastfetch-cli/fastfetch) |
| dunst | free | notification daemon | [](https://github.com/dunst-project/dunst) |
| sway | free | window manager | [](https://swaywm.org/) |
| swayimg | free | image viewer | [](https://github.com/artemsen/swayimg) |
| swaylock | free | screen locker | [](https://github.com/swaywm/swaylock) |
| foot | free | terminal emulator | [](https://codeberg.org/dnkl/foot) |
| krita | free | image editor | [](https://krita.org/en/) |
| libreoffice | free | office suite | [](https://www.libreoffice.org/) |
| vifm | free | file manager | [](https://vifm.info/) |
| network-manager-applet | free | network manager tray icon | [](https://gitlab.gnome.org/GNOME/network-manager-applet) |
| bitwarden | free | password manager | [](https://bitwarden.com/) |
| vesktop | free | customizable discord client | [](https://github.com/Vencord/Vesktop) |
| kid3 | free | audio tagger | [](https://kid3.kde.org/) |

## Useful Links

- [We Are Wayland Now!](https://wearewaylandnow.com/)
- [ArchWiki](https://wiki.archlinux.org/title/Main_page)
- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim/tree/main)
- [r/unixporn](https://www.reddit.com/r/unixporn/)
- [r/wayland](https://www.reddit.com/r/wayland/)
- [r/swaywm](https://www.reddit.com/r/swaywm/)

