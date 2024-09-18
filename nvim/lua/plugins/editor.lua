return {
  -- file explorer icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({
        color_icons = false,
      })
    end,
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
        disable_netrw = true,
        hijack_cursor = true, -- keep cursor on 1st letter of filename
        view = {
          preserve_window_proportions = true,
          number = true, -- show line numbers
          relativenumber = true, -- relative line numbers (hybrid when number is also true)
          width = 34,
          float = { enable = false },
        },
        renderer = {
          add_trailing = true,
          highlight_opened_files = "all",
          indent_markers = { enable = true },
          icons = {
            show = {
              modified = true,
              folder = false,
            },
            padding = "  ",
          },
        },
        diagnostics = { enable = true },
        modified = { enable = true },
      })

      -- use simple statusline for nvim-tree windows
      local nt_api = require("nvim-tree.api")
      nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function()
        local tree_winid = nt_api.tree.winid()

        if tree_winid ~= nil then
          vim.api.nvim_set_option_value(
            "statusline",
            "%t",
            { win = tree_winid }
          )
        end
      end)
    end,
  },
  -- search labels
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
  },
}
