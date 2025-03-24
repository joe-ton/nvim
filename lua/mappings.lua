
require "nvchad.mappings"

-- add yours here

-- mappings.lua or init.lua

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>r", "<cmd>split | term cmd /C go run %<cr>", { desc = "Run Go file" })
map("n", "<leader>t", ":GoTags<CR>", { desc = "Add JSON tags to struct" }) -- ✅ This is correct now

