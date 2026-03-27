-- lua/chadrc.lua
-- This file needs to have same structure as nvconfig.lua
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
}

-- Custom Editor Settings
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Override settings specifically for Go files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = true
    end,
})

-- Override settings specifically for TypeScript files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "typescriptreact" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})

-- Show a vertical bar at column 79
vim.opt.colorcolumn = "79"

-- Enable soft line wrapping at 79 characters (visual wrap, not enforced)
vim.opt.wrap = true
vim.opt.linebreak = true

-- Optional: Set text width for automatic hard wrapping at 79 chars
vim.opt.textwidth = 79

return M
