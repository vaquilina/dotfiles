-- ▘  ▘▗   ▜
-- ▌▛▌▌▜▘  ▐ ▌▌▀▌ Vince Aquilina
-- ▌▌▌▌▐▖▗ ▐▖▙▌█▌ updated for neovim v0.11
--------------- OPTIONS
vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 -- use nvim-tree instead

vim.g.perl_host_prog = "/usr/bin/perl" -- perl host program (for provider)

vim.g.has_nerd_font = true

vim.o.title = true -- display info in the window title

vim.o.number = true -- show line numbers
vim.o.relativenumber = true -- use relative line numbers (hybrid with above)

vim.o.signcolumn = "yes:2" -- use a minimum of 2 columns for the signcolumn

vim.o.syntax = "on" -- syntax highlighting for the current buffer type

vim.o.ignorecase = true -- make searches case-insensitive
vim.o.smartcase = true -- ...unless there is an uppercase character in the query

vim.o.expandtab = true -- use spaces instead of tabs
vim.o.tabstop = 4 -- number of spaces that <Tab> uses in file uses
vim.o.shiftwidth = 4 -- number of spaces used for (auto)indent step

vim.o.wrap = false -- don't wrap long lines

vim.o.cursorline = true -- highlight current line
vim.o.cursorcolumn = true -- highlight current column

vim.o.showmatch = true -- briefly jump to the matching bracket after you insert one
vim.o.matchtime = 3 -- move the cursor back in 3/10s of a second after matching

vim.o.timeout = true -- enable timeout on mappings and keycodes
vim.o.timeoutlen = 1000 -- timeout on mappings is one second

vim.o.undolevels = 1000 -- record the previous 1000 commands
vim.o.undofile = true -- automatically save and restore undo history

vim.o.wildmode = "list:full" -- for command line completion show full list
vim.o.wildignore = "*.swp,*.bak,*.pyc,*.class" -- files matching these patterns are not completed

vim.o.scrolloff = 20 -- minimum number of lines while scrolling
vim.o.sidescrolloff = 5 -- minimum number of columns while side-scrolling

vim.wo.foldmethod = "expr" -- fold levels defined by expression
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- let treesitter handle folding

-- visualize tabs, newlines, spaces
vim.o.listchars = "tab:→ ,eol:↴,space:∙"

--------------- STATUSLINE
vim.o.showmode = true -- display the current mode in the statusline
vim.o.statusline = "%f %y %H%m%r%=%-14.(%l,%c%V%) %P" -- custom statusline

--------------- ABBREVIATIONS
vim.cmd([[cabbrev titlecase s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g]]) -- convert the current line to titlecase

--------------- GLOBAL MAPPINGS
-- map leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- toggle cursorline
vim.keymap.set("n", "<leader>,", ":set cursorline!<cr>")

-- toggle cursorcolumn
vim.keymap.set("n", "<leader>|", ":set cursorcolumn!<cr>")

-- open init.lua in a vsplit to the left
vim.keymap.set("n", "<leader>ev", ":vsplit $MYVIMRC<cr>")

-- source config (not supported with lazy.nvim)
--vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>')

-- write files with ,w
vim.keymap.set("n", "<leader>w", ":w<cr>")

-- clear search highlights
vim.keymap.set("n", "<leader><space>", ":let @/=''<cr>")

-- toggle visualize tabs, newlines, spaces
vim.keymap.set("n", "<leader>l", ":set list!<cr>")

-- convert the current WORD to uppercase in insert mode
vim.keymap.set("i", "<c-u>", "<esc>viwU<esc>ea")

-- covert the current LINE to uppercase in insert mode
vim.keymap.set("i", "<c-l>", "<c-o>VU<esc><End><esc>A")

-- toggle scroll-binding in current window
vim.keymap.set("n", "<leader>bs", ":set scrollbind!<cr>")

-- toggle cursor-binding in current window
vim.keymap.set("n", "<leader>bc", ":set cursorbind!<cr>")

-- insert current date/time in insert mode
vim.keymap.set("i", "<F5>", '<c-r>=strftime("%c")<cr>')

-- toggle nvim-tree explorer (requires nvim-tree plugin)
vim.keymap.set("n", "<c-e>", ":NvimTreeToggle<cr>")

-- emulate i_CTRL+r in terminal
vim.keymap.set("t", "<c-r>", function()
    local next_char_code = vim.fn.getchar()
    local next_char = vim.fn.nr2char(next_char_code)
    return '<C-\\><C-N>"' .. next_char .. "pi"
end, { expr = true })

--------------- AUTOCOMMANDS
-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    command = "silent! lua vim.highlight.on_yank()",
})

-- Enable filetype recognition & syntax highlighting for boxes config files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = {
        vim.fn.expand("$HOME") .. "/.boxes",
        "/etc/boxes-config",
    },
    command = "setfiletype boxes",
})

--------------- PLUGINS
--  I  C    (I - installed, C - configured)
-- [x][ ] gruvbox.nvim      - lua port of gruvbox colorscheme
-- [x][ ] plenary.nvim      - lua api for neovim
-- [x][ ] marks             - marks in sign column
-- [x][ ] nvim-tree         - filesystem tree explorer
-- [x][ ] nvim-web-devicons - icons for nvim-tree
-- [x][ ] flash             - search labels
-- [x][ ] indent-blankline  - show indents & current context
-- [x][ ] gitsigns.nvim     - git marks/blame line -> needs keybinds
-- [ ][ ] nvim-treesitter   - language parsers (highlighting, indentation, folding)

-- needs autocomplete, linting, formatting, diagnostics, code actions, auto-close tags

-- lazy plugin manager
require("config.lazy")

