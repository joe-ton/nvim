return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,                    -- load immediately for .dart files
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("flutter-tools").setup {
        -- add any extra options here later if you want
      }
    end,
  },
}
