return {
    -- file explorer icons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },
    -- file explorer
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
    -- search labels
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    }
}
