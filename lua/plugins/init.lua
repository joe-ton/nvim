-- lua/plugins/init.lua
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- keep commented for now (we'll enable it in conform.lua)
    opts = require "configs.conform",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "go", "markdown",
        "rust", "typescript", "javascript",
      },
      highlight = {
        enable = true,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSPs (rust-analyzer removed – rustaceanvim uses rustup version)
        "gopls",
        "pyright",
        "clangd",
        "ts_ls",
        "lua-language-server",

        -- Formatters
        "gofumpt",
        "goimports",
        "rustfmt",
        "stylua",
        "ruff",
        "clang-format",

        -- Linters
        "golangci-lint",
        "clang-tidy",
      },
    },
  },
  -- rustaceanvim – now forced to load early
  {
    "mrcjkb/rustaceanvim",
    version = "^8",
    lazy = false,               -- <-- this is the key fix
    config = function()
      local nvlsp = require "nvchad.configs.lspconfig"
      vim.g.rustaceanvim = {
        server = {
          on_attach = nvlsp.on_attach,
          on_init = nvlsp.on_init,
          capabilities = nvlsp.capabilities,
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = true,
              check = {
                command = "clippy",
                extraArgs = { "--all-targets", "--all-features", "--no-deps" },
              },
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
              },
              procMacro = { enable = true },
              diagnostics = {
                enable = true,
                styleLints = true,
              },
            },
          },
        },
      }
    end,
  },
}
