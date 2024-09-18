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
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- bash
      lspconfig.bashls.setup({})

      -- c/c++
      lspconfig.clangd.setup({})

      -- cmake
      lspconfig.cmake.setup({})

      -- js/tx/jsx/tsx/json/css/graphql
      lspconfig.biome.setup({})

      -- html
      local html_capabilities = vim.lsp.protocol.make_client_capabilities()
      html_capabilities.textDocument.completion.completionItem.snippetSupport =
        true
      lspconfig.html.setup({
        capabilities = html_capabilities,
      })

      -- lua
      lspconfig.lua_ls.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if
            vim.loop.fs_stat(path .. "/.luarc.json")
            or vim.loop.fs_stat(path .. "/.luarc.jsonc")
          then
            return
          end

          client.config.settings.Lua =
            vim.tbl_deep_extend("force", client.config.settings.Lua, {
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
      })

      -- markdown
      lspconfig.marksman.setup({})

      -- php
      lspconfig.phpactor.setup({})

      -- rust
      lspconfig.rust_analyzer.setup({})

      -- sqls
      lspconfig.sqls.setup({})
    end,
  },

  -- conform
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          sh = { "shfmt" },
          c = { "clang-format" },
          cpp = { "clang-format" },
          lua = { "stylua" },
          rust = { "rustfmt" },
          md = { "mdformat" },
          sql = { "pg_format" },
          yaml = { "yamlfmt" },
          javascript = { "biome" },
          javascriptreact = { "biome" },
          typescript = { "biome" },
          typescriptreact = { "biome" },
          css = { "biome" },
          json = { "biome" },
          scss = { "stylelint" },
        },
        format_on_save = {
          lsp_format = "fallback",
          timeout_ms = 500,
        },
      })
    end,
  },
}
