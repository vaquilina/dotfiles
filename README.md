## Files

| Config | Syntax | System Path | Purpose | Link |
| ------ | ------ | ----------- | ------- | ---- |
| boxes | boxes | `~/.config/boxes/` | custom box design | [boxes](https://github.com/ascii-boxes/boxes) |
| dunst | cfg | `~/.config/dunst/` | notification daemon | [dunst](https://github.com/dunst-project/dunst) |
| fastfetch | jsonc | `~/.config/fastfetch` | fetch program | [fastfetch](https://github.com/fastfetch-cli/fastfetch) |
| foot | dosini | `~/.config/foot/` | wayland terminal emulator | [foot](https://codeberg.org/dnkl/foot) |
| galculator | conf | `~/.config/galculator/` | simple gtk calculator | [galculator](http://galculator.mnim.org/) |
| gtk-2.0 | gtkrc | `~` | gtk2 | [GTK](https://www.gtk.org/) |
| gtk-3.0 | css, dosini | `~/.config/gtk-3.0/` | gtk3 | [GTK](https://www.gtk.org/) |
| kvantum | - | `~/.config/Kvantum/` | Qt theme manager | [kvantum](https://store.kde.org/p/1005410) |
| nvim (nightly) | lua, toml | `~/.config/nvim/` | editor | [neovim](https://neovim.io/) |
| nwg-bar | json, css | `~/.config/nwg-bar/` | gtk3 button bar | [nwg-bar](https://github.com/nwg-piotr/nwg-bar) |
| sway | swayconfig | `~/.config/sway/` | wayland WM based on i3 | [sway](https://swaywm.org/) |
| tofi | conf | `~/.config/tofi/` | wayland launcher menu | [tofi](https://github.com/philj56/tofi) |
| vifm | vifm | `~/.config/vifm/` | terminal file manager with vi-like bindings | [vifm](https://vifm.info/) |
| waybar | jsonc, css | `~/.config/waybar/` | wayland status bar | [waybar](https://github.com/Alexays/Waybar) |
| xsettingsd | conf | `~/.config/xsettingsd/` | X settings daemon for XWayland | [xsettingsd](https://wiki.archlinux.org/title/Xsettingsd) |
| zenity | bash | `~/.config/zenity/` | wayland-compatible password prompt (`sudo -A`) | [zenity](https://help.gnome.org/users/zenity/stable/) |
| zsh | zsh | `~` | shell | [zsh](https://zsh.sourceforge.io/) |

## Themes

| Type | Theme | URL |
| ---- | ----- | --- |
| GTK Cursors | Simp1e-Gruvbox-Dark | <https://www.pling.com/p/1932768/> |
| GTK Icons | Gruvbox Plus Dark | <https://www.gnome-look.org/s/Gnome/p/1961046> |
| GTK Theme | Gruvbox-Material-Dark-HIDPI | <https://github.com/TheGreatMcPain/gruvbox-material-gtk> |
| GUI Font | AnonymicePro Nerd Font | <https://www.nerdfonts.com/> |
| Neovim Colorscheme | gruvbox.nvim | <https://github.com/ellisonleao/gruvbox.nvim> |
| Qt/Kvantum Theme | Gruvbox-Dark-Brown | <https://store.kde.org/p/1976481> |
| Terminal Font | Terminess Nerd Font | <https://www.nerdfonts.com/> |
| Vifm Colorscheme | gruvbox | <https://github.com/vifm/vifm-colors/blob/master/gruvbox.vifm> |
| foot Theme | gruvbox | built-in |

## Neovim Plugins

Plugins are managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

| Plugin | Use | Spec Path | Repo |
| ------ | --- | --------- | ---- |
| conform.nvim | code formatter | `nvim/lua/plugins/coding.lua` | stevearc/conform.nvim |
| coq_nvim | code autocomplete/snippets | `nvim/lua/plugins/coding.lua` | ms-jpq/coq_nvim |
| gitsigns.nvim | git indicators/blame line | `nvim/lua/plugins/ui.lua` | lewis6991/gitsigns.nvim |
| gruvbox.nvim | colorscheme | `nvim/lua/plugins/colorscheme.lua` | ellisonleao/gruvbox.nvim |
| indent-blankline.nvim | scope/indentation guides | `nvim/lua/plugins/ui.lua` | lukas-reineke/indent-blankline.nvim |
| marks.nvim | marks in signcolumn | `nvim/lua/plugins/ui.lua` | chentoast/marks.nvim |
| nvim-lspconfig | lsp configs | `nvim/lua/plugins/coding.lua` | neovim/nvim-lspconfig |
| nvim-tree | netrw-like file explorer | `nvim/lua/plugins/editor.lua` | nvim-tree/nvim-tree.lua |
| nvim-treesitter | highlighting/indentation/folding | `nvim/lua/plugins/coding.lua` | nvim-treesitter/nvim-treesitter |
| nvim-ts-autotag | auto close/rename HTML tags | `nvim/lua/plugins/coding.lua` | windwp/nvim-ts-autotag |
| nvim-web-devicons | icons for nvim-tree | `nvim/lua/plugins/editor.lua` | nvim-tree/nvim-web-devicons |
| plenary.nvim | lua API | `nvim/lua/plugins/util.lua` | nvim-lua/plenary.nvim |
| resty | REST client | `nvim/lua/plugins/tools.lua` | lima1909/resty.nvim |
| neominimap | vscode-like minimap (braille) | `nvim/lua/plugins/ui.lua` | Isrothy/neominimap.nvim |
| nvim-lsp-file-operations | lsp file operations integration | `nvim/lua/plugins/coding.lua` | antosha417/nvim-lsp-file-operations |
| lazydev | faster luals setup | `nvim/lua/plugins/coding.lua` | folke/lazydev.nvim |
| render-markdown | render markdown inline | `nvim/lua/plugins/editor.lua` | MeanderingProgrammer/render-markdown.nvim |

## Extra Waybar Modules

| Module | URL |
| ------ | --- |
| waybar-module-pacman-updates | <https://github.com/coffebar/waybar-module-pacman-updates> |

## Tools

| Tool | License | Use | Link |
| ---- | ------- | --- | ---- |
| bitwarden | free | password manager | <https://bitwarden.com/> |
| dunst | free | notification daemon | <https://github.com/dunst-project/dunst> |
| fastfetch | free | system information fetcher | <https://github.com/fastfetch-cli/fastfetch> |
| foot | free | terminal emulator | <https://codeberg.org/dnkl/foot> |
| insync | paid | google drive/dropbox sync | <https://www.insynchq.com/> |
| kid3 | free | audio tagger | <https://kid3.kde.org/> |
| krita | free | image editor | <https://krita.org/en/> |
| kvantum | free | Qt theme engine/configurator | <https://store.kde.org/p/1005410> |
| libreoffice | free | office suite | <https://www.libreoffice.org/> |
| network-manager-applet | free | network manager tray icon | <https://gitlab.gnome.org/GNOME/network-manager-applet> |
| nwg-look | free | graphical GTK configurator | <https://github.com/nwg-piotr/nwg-look> |
| solaar | free | logitech device manager | <https://github.com/pwr-Solaar/Solaar> |
| sway | free | window manager | <https://swaywm.org/> |
| swayimg | free | image viewer | <https://github.com/artemsen/swayimg> |
| swaylock | free | screen locker | <https://github.com/swaywm/swaylock> |
| udiskie | free | automount removable media | <https://github.com/coldfix/udiskie> |
| vesktop | free | customizable discord client | <https://github.com/Vencord/Vesktop> |
| vifm | free | file manager | <https://vifm.info/> |
| wev | free | xev-like wayland event viewer | <https://github.com/jwrdegoede/wev> |
| gitnuro | free | graphical git client | <https://gitnuro.com/> |

## Useful Links

- [ArchWiki](https://wiki.archlinux.org/title/Main_page)
- [We Are Wayland Now!](https://wearewaylandnow.com/)
- [r/swaywm](https://www.reddit.com/r/swaywm/)
- [r/wayland](https://www.reddit.com/r/wayland/)
- [r/unixporn](https://www.reddit.com/r/unixporn/)

