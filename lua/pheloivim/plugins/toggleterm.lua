return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    {
      "<leader>gl",
      function()
        require("utils.terminal").toggle({
          cmd = "lazygit",
          size = 30,
          direction = "float",
        })
      end,
      desc = "Lazygit",
    },
    {
      "<leader>Tt",
      vim.cmd.ToggleTerm,
      desc = "Toggle terminal",
    },
  },
  opts = {
    size = 14,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    shade_terminals = true,
    start_in_insert = true,
  },
}
