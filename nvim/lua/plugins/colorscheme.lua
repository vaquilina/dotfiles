return {
    -- gruvbox
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
        contrast = "hard",
        transparent_mode = true,
    },
    init = function()
        vim.cmd([[colorscheme gruvbox]])
    end,
}
