return {
    -- indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    -- marks in sign column
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {
            excluded_filetypes = {
                "neominimap",
            },
        },
    },
    -- neominimap
    ---@module "neominimap.config.meta"
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
            ---@enum Neominimap.Handler.Annotation
            local AnnotationMode = {
                Sign = "sign", ---@type string -- show braille signs in the sign column
                Icon = "icon", ---@type string -- show icons in the sign column
                Line = "line", ---@type string -- highlight the background of the line on the minimap
            }

            --- Put your configuration here
            vim.g.neominimap = {
                -- Enable the plugin by default
                auto_enable = true, ---@type boolean

                -- Log level
                log_level = vim.log.levels.OFF,

                -- Notification level
                notification_level = vim.log.levels.INFO,

                -- Minimap will not be created for buffers of these types
                exclude_buftypes = {
                    "nofile", ---@type string
                    "nowrite", ---@type string
                    "quickfix", ---@type string
                    "terminal", ---@type string
                    "prompt", ---@type string
                },

                -- How many columns a dot should span
                x_multiplier = 4, ---@type number

                -- How many rows a dot should span
                y_multiplier = 1, ---@type number

                -- Either `split` or `float`
                -- `float` - minimap will be created in floating windows attached to all suitable windows
                -- `split` - minimap will be created in one split window
                layout = "split", ---@type "float"|"split"

                -- Used when `layout` is set to `split`
                split = {
                    minimap_width = 20, ---@type number

                    -- Always fix the width of the split window
                    fix_width = true, ---@type boolean

                    -- split direction ("left" or "right")
                    direction = "right", ---@type "left"|"right"

                    -- Automatically close the split window when it is the last window
                    close_if_last_window = true, ---@type boolean
                },

                -- Minimap refresh delay after text change
                delay = 200, ---@type number

                -- Sync the cursor position with the minimap
                sync_cursor = true, ---@type boolean

                click = {
                    -- Enable mouse click on minimap
                    enabled = false, ---@type boolean
                    -- Automatically switch focus to minimap when clicked
                    auto_switch_focus = true, ---@type boolean
                },

                diagnostic = {
                    enabled = true,
                    severity = vim.diagnostic.severity.WARN,
                    mode = AnnotationMode.Line,
                    priority = {
                        ERROR = 100, ---@type number
                        WARN = 90, ---@type number
                        INFO = 80, ---@type number
                        HINT = 70, ---@type number
                    },
                },

                git = {
                    enabled = true,
                    mode = AnnotationMode.Icon,
                    priority = 6,
                    icon = {
                        add = "+ ", ---@type string
                        change = "~ ", ---@type string
                        delete = "- ", ---@type string
                    },
                },

                search = {
                    enabled = true,
                    mode = AnnotationMode.Line,
                    priority = 10,
                },

                treesitter = {
                    enabled = true,
                    priority = 200,
                },

                fold = {
                    -- Consider folds when rendering minimap
                    enabled = true,
                },

                --  Override the default winopt
                winopt = function(opt, winid)
                    return {
                        winhighlight = table.concat({
                            "Normal:NeominimapBackground",
                            "FloatBorder:NeominimapBorder",
                            "CursorLine:NeominimapCursorLine",
                            "CursorLineNr:NeominimapCursorLineNr",
                            "CursorLineSign:NeominimapCursorLineSign",
                            "CursorLineFold:NeominimapCursorLineFold",
                        }, ","),
                        wrap = false, ---@type boolean
                        foldcolumn = "0", ---@type string
                        signcolumn = "yes:2", ---@type string
                        cursorcolumn = false, ---@type boolean
                        number = false, ---@type boolean
                        relativenumber = false, ---@type boolean
                        scrolloff = 99999, ---@type number -- To center minimap
                        sidescrolloff = 0, ---@type number
                        winblend = 0, ---@type number
                        cursorline = true, ---@type boolean
                        spell = false, ---@type boolean
                        list = false, ---@type boolean
                        fillchars = "eob: ", ---@type string
                        winfixwidth = true, ---@type boolean
                    }
                end,

                -- Override the default bufopt
                --bufopt = function(opt, bufnr) end,
            }
        end,
    },
}
