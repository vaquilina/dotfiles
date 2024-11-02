return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
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
            highlight = { enable = true },
            indent = {
                enable = true,
                disable = { "lua" },
            },
            additional_vim_regex_highlighting = false,
        },
    },
    -- ts-autotag
    {
        "windwp/nvim-ts-autotag",
        opts = {},
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
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescript.tsx",
                    "typescriptreact",
                    "astro",
                    "svelte",
                    "vue",
                    "css",
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
                    local path = client.workspace_folders[1].name
                    if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                        return
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            },
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
                -- See the configuration section for more details
                "neominimap.nvim",
            },
        },
    },
}
