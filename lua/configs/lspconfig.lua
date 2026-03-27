-- lua/configs/lspconfig.lua
require("nvchad.configs.lspconfig").defaults()
local nvlsp = require "nvchad.configs.lspconfig"

local servers = { "html", "cssls", "clangd", "gopls", "pyright", "ts_ls" }

for _, lsp in ipairs(servers) do
  if lsp == "gopls" then
    require("lspconfig").gopls.setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
        },
      },
    }
  elseif lsp == "clangd" then
    require("lspconfig").clangd.setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--clang-tidy-checks=*",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
      },
    }
  else
    require("lspconfig")[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end
