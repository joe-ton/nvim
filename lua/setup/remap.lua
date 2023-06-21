
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Gets rid of highlight after searching
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", {silent=true, noremap=true})
