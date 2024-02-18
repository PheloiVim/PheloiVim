return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    { "<F5>", "<cmd>ToggleTerm<cr>" },
  },
  opts = {
    shell = "fish",
    size = 14,
    on_create = function()
      vim.opt.foldcolumn = "0"
      vim.opt.signcolumn = "no"
    end,
    open_mapping = [[<F5>]],
    shading_factor = 2,
  },
}
