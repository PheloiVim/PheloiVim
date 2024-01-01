return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  },
  dependencies = {
    { "folke/twilight.nvim", opts = {} },
  },
  opts = {
    window = {
      backdrop = 1,
      width = function() return math.min(120, vim.o.columns * 0.75) end,
      height = 0.9,
      options = {
        number = false,
        relativenumber = false,
        foldcolumn = "0",
        list = false,
        showbreak = "NONE",
        signcolumn = "no",
      },
    },
  },
}
