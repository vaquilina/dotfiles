return {
    -- gruvbox
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "hard",
            transparent_mode = true,
        })

        vim.cmd([[colorscheme gruvbox]])
    end,
}
