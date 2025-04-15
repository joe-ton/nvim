-- mappings.lua


require "nvchad.mappings"

-- add yours here

-- mappings.lua or init.lua

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>r", "<cmd>split | term cmd /C go run %<cr>", { desc = "Run Go file" })
map("n", "<leader>t", ":GoTags add json<CR>", { desc = "Add JSON tags to struct" })
-- Align struct fields in current file using goimports
vim.keymap.set("n", "<leader>T", "<cmd>!gofumpt -w %<cr><cmd>edit!<cr>", {
  desc = "Format file using gofumpt"
})

-- comment out
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Toggle comment (visual)" })

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", harpoon_mark.add_file)
vim.keymap.set("n", "<leader>h", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>1", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon_ui.nav_file(4) end)

-- fuzzy finding
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

-- delete buffer
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { desc = "Delete current buffer" })

