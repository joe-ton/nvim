-- nvim/lua/configs/lspconfig.lua

-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "gopls", "pyright", "rust-analyzer", "tsserver"}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- Optional: Custom clangd setup for MinGW64 (uncomment if needed for query-driver)
-- lspconfig.clangd.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   cmd = {
--     "clangd",
--     "--background-index",
--     "--suggest-missing-includes",
--     "--clang-tidy",
--     "--query-driver=C:/msys64/mingw64/bin/g++.exe"  -- Adjust to your MinGW path, e.g., C:/mingw-w64/bin/g++.exe
--   },
-- }
