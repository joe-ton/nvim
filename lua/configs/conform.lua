-- lua/configs/conform.lua
-- heavy
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "goimports" },
    rust = { "rustfmt" },
    python = { "ruff" },           -- formats + lints Python
    cpp = { "clang_format" },
    c = { "clang_format" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
return options
