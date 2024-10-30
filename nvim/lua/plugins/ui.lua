return {
    -- indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = true,
    },
    -- marks in sign column
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },
    -- neominimap
    {
        "Isrothy/neominimap.nvim",
        version = "V3.*.*",
        enabled = true,
        lazy = false,
        keys = {
            -- Global Minimap Controls
            { "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
            { "<leader>no", "<cmd>Neominimap on<cr>", desc = "Enable global minimap" },
            { "<leader>nc", "<cmd>Neominimap off<cr>", desc = "Disable global minimap" },
            { "<leader>nr", "<cmd>Neominimap refresh<cr>", desc = "Refresh global minimap" },

            -- Window-Specific Minimap Controls
            { "<leader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
            { "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
            { "<leader>now", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
            { "<leader>nwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },

            -- Tab-Specific Minimap Controls
            { "<leader>ntt", "<cmd>Neominimap tabToggle<cr>", desc = "Toggle minimap for current tab" },
            { "<leader>ntr", "<cmd>Neominimap tabRefresh<cr>", desc = "Refresh minimap for current tab" },
            { "<leader>nto", "<cmd>Neominimap tabOn<cr>", desc = "Enable minimap for current tab" },
            { "<leader>ntc", "<cmd>Neominimap tabOff<cr>", desc = "Disable minimap for current tab" },

            -- Buffer-Specific Minimap Controls
            { "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
            { "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
            { "<leader>nbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
            { "<leader>nbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },

            ---Focus Controls
            { "<leader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
            { "<leader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
            { "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
        },
        init = function()
            -- The following options are recommended when layout == "float"
            vim.opt.wrap = false
            vim.opt.sidescrolloff = 36 -- Set a large value

            local AnnotationMode = {
                Sign = "sign", -- show braille signs in the sign column
                Icon = "icon", -- show icons in the sign column
                Line = "line", -- highlight the background of the line on the minimap
            }

            --- Put your configuration here
            vim.g.neominimap = {
                -- Enable the plugin by default
                auto_enable = true,

                -- Log level
                log_level = vim.log.levels.OFF,

                -- Notification level
                notification_level = vim.log.levels.INFO,

                -- Minimap will not be created for buffers of these types
                exclude_buftypes = {
                    "nofile",
                    "nowrite",
                    "quickfix",
                    "terminal",
                    "prompt",
                },

                -- When false is returned, the minimap will not be created for this buffer
                buf_filter = function()
                    return true
                end,

                -- When false is returned, the minimap will not be created for this window
                win_filter = function()
                    return true
                end,

                -- How many columns a dot should span
                x_multiplier = 4,

                -- How many rows a dot should span
                y_multiplier = 1,

                -- Either `split` or `float`
                -- `float` - minimap will be created in floating windows attached to all suitable windows
                -- `split` - minimap will be created in one split window
                layout = "split",

                -- Used when `layout` is set to `split`
                split = {
                    minimap_width = 20,

                    -- Always fix the width of the split window
                    fix_width = true,

                    -- split direction ("left" or "right")
                    direction = "right",

                    -- Automatically close the split window when it is the last window
                    close_if_last_window = true,
                },

                -- Used when `layout` is set to `float`
                float = {
                    minimap_width = 20,

                    -- If set to nil, there is no maximum height restriction
                    max_minimap_height = nil,

                    margin = {
                        right = 0,
                        top = 0,
                        bottom = 0,
                    },

                    -- Border style of the floating window
                    -- Accepts all usual border styles ["single", "double", "none", "shadow"]
                    window_border = "none",

                    -- Minimap refresh delay after text change
                    delay = 200,

                    -- Sync the cursor position with the minimap
                    sync_cursor = true,

                    click = {
                        -- Enable mouse click on minimap
                        enabled = false,
                        -- Automatically switch focus to minimap when clicked
                        auto_switch_focus = true,
                    },

                    diagnostic = {
                        enabled = true,
                        severity = vim.diagnostic.severity.WARN,
                        mode = AnnotationMode.Line,
                        priority = {
                            ERROR = 100,
                            WARN = 90,
                            INFO = 80,
                            HINT = 70,
                        },
                        icon = {
                            ERROR = "󰅚 ",
                            WARN = "󰀪 ",
                            INFO = "󰌶 ",
                            HINT = " ",
                        },
                    },

                    git = {
                        enabled = true,
                        mode = AnnotationMode.Sign,
                        priority = 6,
                        icon = {
                            add = "+ ",
                            change = "~ ",
                            delete = "- ",
                        },
                    },

                    search = {
                        enabled = true,
                        mode = AnnotationMode.Icon,
                        priority = 10,
                        key = "m",
                        show_builtins = false, -- shows the builtin marks like [ ] < >
                    },

                    fold = {
                        -- Consider folds when rendering minimap
                        enabled = true,
                    },

                    -- Override the default winopt
                    --winopt = function(opt, winid) end,

                    -- Override the default bufopt
                    --bufopt = function(opt, bufnr) end,

                    handlers = {},
                },
            }
        end,
    },
}
