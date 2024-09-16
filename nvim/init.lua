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

-- FIXME: code folding not working
vim.o.foldmethod = "expr" -- fold levels defined by expression
vim.o.foldexpr = "nvim_treesitter#foldexpr()" -- let treesitter handle folding

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
-- [X][X] gruvbox.nvim      - lua port of gruvbox colorscheme
-- [X][-] plenary.nvim      - lua api for neovim
-- [X][X] marks             - marks in sign column
-- [X][X] nvim-tree         - filesystem tree explorer
-- [X][X] nvim-web-devicons - icons for nvim-tree
-- [X][X] indent-blankline  - show indents & current context
-- [X][ ] gitsigns.nvim     - git marks/blame line -> needs keybinds
-- [X][X] mason             - portable package manager for LSPs, DAPs, linters & formatters
-- [X][ ] mason-lspconfig   - bridge between mason & lspconfig
-- [X][ ] nvim-lspconfig    - configs for the nvim LSP client -- LSPs need additional configuration
-- [X][ ] none-ls           - null-ls maintained by the community; use nvim as LSP to inject diagnostics, actions, etc
-- [X][X] mason-null-ls     - bridge between mason & null-ls

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim plugin spec
-- https://github.com/folke/lazy.nvim
require("lazy").setup(
  -- plugins
  {
    -- gruvbox.nvim
    -- https://github.com/ellisonleao/gruvbox.nvim
    {
      "ellisonleao/gruvbox.nvim",
      lazy = false, -- load during startup (main colorscheme)
      priority = 1000, -- load this before all the other start plugins
      config = function()
        vim.cmd([[colorscheme gruvbox]])
      end,
    },
    -- plenary.nvim
    -- https://github.com/nvim-lua/plenary.nvim
    { "nvim-lua/plenary.nvim" },
    -- nvim-web-devicons
    -- https://github.com/nvim-tree/nvim-web-devicons
    { "nvim-tree/nvim-web-devicons", lazy = true },
    -- marks.nvim
    -- https://github.com/chentoast/marks.nvim
    {
      "chentoast/marks.nvim",
      lazy = false,
      opts = { builtin_marks = { ".", "<", ">", "^" } },
    },
    -- nvim-tree
    -- https://github.com/nvim-tree/nvim-tree.lua
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup({
          hijack_cursor = true, -- keep cursor on 1st letter of filename
          view = {
            number = true, -- show line numbers
            relativenumber = true, -- relative line numbers (hybrid when number is also true)
            float = {
              enable = true,
              open_win_config = {
                border = "single",
                width = 50,
                height = 50,
                row = 2,
                col = 5,
              },
            },
          },
          renderer = {
            highlight_opened_files = "icon",
            indent_markers = { enable = true },
            icons = {
              show = { modified = true },
              web_devicons = {
                folder = {
                  enable = true,
                },
              },
            },
          },
          modified = { enable = true },
        })
      end,
    },
    -- indent-blankline.nvim
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      config = true,
    },
    -- gitsigns.nvim
    -- https://github.com/lewis6991/gitsigns.nvim
    {
      "lewis6991/gitsigns.nvim",
      config = true,
    },
    -- mason.nvim
    -- https://github.com/williamboman/mason.nvim
    {
      "williamboman/mason.nvim",
      lazy = false,
      config = true,
    },
    -- mason-lspconfig.nvim
    -- https://github.com/williamboman/mason-lspconfig.nvim
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "bashls",
          "biome",
          "clangd",
          "html",
          "lua_ls",
          "vimls",
          "marksman",
        },
      },
    },
    -- nvim-lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    {
      "neovim/nvim-lspconfig",
      config = function()
        local lspconfig = require("lspconfig")

        --Enable (broadcasting) snippet capability for completion
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport =
          true

        -- https://github.com/bash-lsp/bash-language-server
        lspconfig.bashls.setup({})
        -- https://biomejs.dev
        lspconfig.biome.setup({})
        -- https://clangd.llvm.org/installation.html
        lspconfig.clangd.setup({})
        -- https://github.com/hrsh7th/vscode-langservers-extracted
        lspconfig.html.setup({ capabilities = capabilities })
        -- https://github.com/luals/lua-language-server
        lspconfig.lua_ls.setup({
          on_init = function(client)
            local path = client.workspace_folders[1].name
            if
              not vim.loop.fs_stat(path .. "/.luarc.json")
              and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
            then
              client.config.settings =
                vim.tbl_deep_extend("force", client.config.settings, {
                  Lua = {
                    runtime = {
                      -- Tell the language server which version of Lua you're using
                      -- (most likely LuaJIT in the case of Neovim)
                      version = "LuaJIT",
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                      checkThirdParty = false,
                      library = { vim.env.VIMRUNTIME },
                    },
                  },
                })

              client.notify(
                "workspace/didChangeConfiguration",
                { settings = client.config.settings }
              )
            end
            return true
          end,
        })
        -- https://github.com/iamcco/vim-language-server
        lspconfig.vimls.setup({})
        -- https://github.com/artempyanykh/marksman
        lspconfig.marksman.setup({})
      end,
    },
    -- none-ls
    -- https://github.com/nvimtools/none-ls.nvim
    {
      "nvimtools/none-ls.nvim",
      config = function()
        local null_ls = require("null-ls")

        -- built-ins
        local code_actions = null_ls.builtins.code_actions
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        local hover = null_ls.builtins.hover
        local completion = null_ls.builtins.completion

        -- format on save callback
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- avoid lsp formatting conflicts (use none-ls)
        -- https://github.com/nvimtools/none-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
        local lsp_formatting = function(bufnr)
          vim.lsp.buf.format({
            filter = function(client)
              -- apply whatever logic you want (in this example, we'll only use null-ls)
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end

        null_ls.setup({
          sources = {
            -- code actions
            code_actions.gitsigns,
            -- diagnostics
            diagnostics.markdownlint,
            diagnostics.markuplint,
            diagnostics.selene,
            diagnostics.tidy,
            diagnostics.vint,
            -- formatting
            formatting.biome,
            formatting.clang_format,
            formatting.stylua,
            -- hover
            hover.printenv,
            -- completion
            completion.luasnip,
          },
          -- format on save
          on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  lsp_formatting(bufnr)
                end,
              })
            end
          end,
        })
      end,
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
    -- mason-null-ls
    -- https://github.com/jay-babu/mason-null-ls.nvim
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
      },
      opts = {
        -- primary source of truth is null-ls
        ensure_installed = nil,
        automatic_installation = true,
      },
    },
  },

  -- opts
  {
    install = { missing = true, colorscheme = { "gruvbox" } },
    checker = { enabled = true },
  }
)
