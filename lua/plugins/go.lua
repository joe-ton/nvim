-- go.lua

return {
  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
    config = function()
      vim.g.go_addtags_transform = "snakecase"
      vim.g.go_addtags_options = "json"
    end,
  },
}

