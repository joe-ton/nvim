-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Already did in core.setup
-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

vim.keymap.set('n', '<leader>pt', ':NvimTreeFindFileToggle<CR>')

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
