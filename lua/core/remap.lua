
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>pv', '<cmd>Ex<CR>', { silent = true })
-- Gets rid of highlight after searching
-- vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", {silent=true, noremap=true})
