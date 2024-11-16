return {
    -- nvim-web-devicons (icons for nvim-tree)
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
        opts = {},
    },
    -- nvim-tree (file explorer)
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            disable_netrw = true,
            hijack_cursor = true, -- keep cursor on 1st letter of filename
            view = {
                preserve_window_proportions = true,
                number = true, -- show line numbers
                relativenumber = true, -- relative line numbers (hybrid when number is also true)
                width = 36,
                float = { enable = false },
            },
            renderer = {
                add_trailing = true,
                highlight_opened_files = "all",
                indent_markers = { enable = true },
                icons = {
                    show = {
                        folder = false,
                        hidden = true,
                    },
                    padding = " ",
                    glyphs = {
                        hidden = "",
                        git = {
                            unstaged = "",
                        },
                    },
                },
            },
            diagnostics = { enable = true },
            modified = { enable = true },
        },
        init = function()
            -- use simple statusline for nvim-tree windows
            local nt_api = require("nvim-tree.api")
            nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function()
                local tree_winid = nt_api.tree.winid()

                if tree_winid ~= nil then
                    vim.api.nvim_set_option_value("statusline", "%t", { win = tree_winid })
                end
            end)
        end,
    },
    -- nvim-lsp-file-operations (plugin for nvim-tree that hooks into lsp file operations)
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        },
        opts = {},
    },
    -- render-markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        ---@module 'render-markdown',
        ---@type render.md.UserConfig
        opts = {},
    },
}
