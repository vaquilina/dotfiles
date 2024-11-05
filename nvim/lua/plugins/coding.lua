return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "cmake",
                    "comment",
                    "cpp",
                    "css",
                    "csv",
                    "diff",
                    "gitignore",
                    "html",
                    "http",
                    "ini",
                    "java",
                    "javascript",
                    "jsdoc",
                    "json",
                    "jsonc",
                    "lua",
                    "luadoc",
                    "markdown",
                    "markdown_inline",
                    "nix",
                    "php",
                    "phpdoc",
                    "python",
                    "regex",
                    "rust",
                    "scss",
                    "sql",
                    "tsx",
                    "typescript",
                    "udev",
                    "vim",
                    "vimdoc",
                    "yaml",
                    "zathurarc",
                },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                highlight = { enable = true, additional_vim_regex_highlighting = false },
                indent = {
                    enable = true,
                    disable = { "lua" },
                },
                modules = {},
            })
        end,
    },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    -- ts-autotag
    {
        "windwp/nvim-ts-autotag",
        config = true,
    },
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        lazy = false, -- REQUIRED for coq_nvim,
        dependencies = {
            { "ms-jpq/coq_nvim", branch = "coq" },
            { "ms-jpq/coq.artifacts", branch = "artifacts" },
        },
        init = function()
            vim.g.coq_settings = {
                -- suppress welcome message
                auto_start = "shut-up",
            }
        end,
        config = function()
            local lspconfig = require("lspconfig")
            local coq = require("coq")

            -- bash
            lspconfig.bashls.setup(coq.lsp_ensure_capabilities({}))

            -- c/c++
            lspconfig.clangd.setup(coq.lsp_ensure_capabilities({}))

            -- cmake
            lspconfig.cmake.setup({})

            -- js/ts/jsx/tsx/json/css/graphql (biome)
            lspconfig.biome.setup(coq.lsp_ensure_capabilities({
                filetypes = {
                    "astro",
                    "css",
                    "graphql",
                    "javascript",
                    "javascriptreact",
                    "svelte",
                    "typescript",
                    "typescript.tsx",
                    "typescriptreact",
                    "vue",
                },
            }))

            -- json
            local json_capabilities = vim.lsp.protocol.make_client_capabilities()
            json_capabilities.textDocument.completion.completionItem.snippetSupport = true
            lspconfig.jsonls.setup(coq.lsp_ensure_capabilities({
                capabilities = json_capabilities,
            }))

            -- html
            local html_capabilities = vim.lsp.protocol.make_client_capabilities()
            html_capabilities.textDocument.completion.completionItem.snippetSupport = true
            lspconfig.html.setup(coq.lsp_ensure_capabilities({
                capabilities = html_capabilities,
            }))

            -- custom elements
            lspconfig.custom_elements_ls.setup(coq.lsp_ensure_capabilities({}))

            -- lua
            lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of neovim)
                            version = "LuaJIT",
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                -- Depending on the usage, you might want to add additional paths here
                                -- "${3rd}/luv/library",
                                -- "${3rd}/busted/library",
                            },
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        },
                    })
                end,
                settings = {
                    Lua = {},
                },
            }))

            -- markdown
            lspconfig.marksman.setup(coq.lsp_ensure_capabilities({}))

            -- php
            lspconfig.phpactor.setup(coq.lsp_ensure_capabilities({}))

            -- rust
            lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({}))

            -- sqls
            lspconfig.sqls.setup(coq.lsp_ensure_capabilities({}))

            -- pkgbuild
            lspconfig.pkgbuild_language_server.setup(coq.lsp_ensure_capabilities({}))
        end,
    },
    -- conform
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                c = { "clang-format" },
                cpp = { "clang-format" },
                css = { "biome" },
                html = { "htmlbeautifier" },
                javascript = { "biome" },
                javascriptreact = { "biome" },
                json = { "biome" },
                lua = { "stylua" },
                md = { "mdformat" },
                rust = { "rustfmt" },
                scss = { "stylelint" },
                sh = { "shfmt" },
                sql = { "pg_format" },
                typescript = { "biome" },
                typescriptreact = { "biome" },
                yaml = { "yamlfmt" },
                ["*"] = { "codespell" },
            },
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
        },
    },
    -- lazydev (luals helper)
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                "neominimap.nvim",
                "lazy.nvim",
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    -- optional `vim.uv` typings
    { "Bilal2453/luvit-meta", lazy = true },
}
