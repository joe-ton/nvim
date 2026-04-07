-- lua/plugins/init.lua
return {
  {
    "stevearc/conform.nvim",
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
        "dart",   -- Flutter
        "cpp",    -- C++
        "c",      -- C
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
  {
    "mrcjkb/rustaceanvim",
    version = "^8",
    lazy = false,
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

  -- Neotest: run tests
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      "fredrikaverpil/neotest-golang",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
      "orjangj/neotest-ctest",

      "vim-test/vim-test",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-golang")({
            go_test_args = { "-v", "-race", "-count=1" },
          }),
          require("neotest-python")({
            runner = "pytest",
          }),
          require("neotest-rust"),
          require("neotest-ctest"),
          require("neotest-vim-test")({
            allow_file_types = { "dart" },
          }),
        },
        summary = { open = "botright vsplit 65", animated = true },
        output = { open_on_run = "short" },
        quickfix = { open = false },
        status = { virtual_text = true },
      })

      -- Flutter config
      vim.g["test#dart#runner"] = "fluttertest"
      vim.g["test#strategy"] = "neovim"
    end,
  },

  -- 🔥 FIXED tiny-inline-diagnostic (this version works reliably)
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",           -- changed to this for reliable loading with clangd
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "modern",
        options = {
          show_source = { enabled = true },
          multilines = {
            enabled = true,
            always_show = true,
          },
        },
      })
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
