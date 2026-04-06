return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "ray-x/lsp_signature.nvim",   -- ← this gives you Jon-style rich popups
    event = "VeryLazy",
    opts = {
      hint_enable = false,          -- no annoying inline text
      floating_window = true,
      floating_window_above_cur_line = true,
      floating_window_off_x = 0,
      floating_window_off_y = 0,
      border = "rounded",           -- nice clean border like Jon’s
      always_trigger = false,       -- only show when you type ( or move cursor inside args
      toggle_key = "<C-k>",         -- optional: press Ctrl+k to force the popup
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}
