-- lua/custom/init.lua

-- Maintain 4-line buffer above and below cursor for readability
vim.opt.scrolloff = 4

-- Go: add JSON tags to all structs (your custom command)
vim.api.nvim_create_user_command("GoTags", function()
  local filename = vim.fn.expand("%:p")
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local struct_names = {}
  for _, line in ipairs(lines) do
    local name = line:match("^%s*type%s+(%w+)%s+struct%s*{")
    if name then
      table.insert(struct_names, name)
    end
  end
  if #struct_names == 0 then
    vim.notify("No structs found in file", vim.log.levels.WARN)
    return
  end
  for _, struct in ipairs(struct_names) do
    local cmd = string.format(
      "gomodifytags -file %s -struct %s -add-tags json -transform snakecase -w",
      filename, struct
    )
    vim.fn.system(cmd)
  end
  vim.cmd("edit!") -- reload file
  vim.notify("Added JSON tags to " .. #struct_names .. " struct(s)")
end, { desc = "Add JSON tags to all structs in file" })

-- Completion (your custom cmp setup — NvChad already loads cmp, this overrides mappings)
local cmp = require'cmp'
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
})

-- Auto-format Go files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- C/C++: force 4-space tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "h", "hpp" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- Extra plugins (keep this return table exactly as you had it)
return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "go", "markdown",
      },
      highlight = { enable = true },
    },
  },
}
