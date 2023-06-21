
local lsp = require('lsp-zero')

lsp.preset('recommended')


local nvim_lsp = require('lspconfig')
nvim_lsp.pyright.setup{}
