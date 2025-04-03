-- comment.lua

return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Toggle comment" },
      { "gb", mode = { "n", "v" }, desc = "Toggle block comment" },
    },
  },
}

