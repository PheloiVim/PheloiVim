return {
  "akinsho/toggleterm.nvim",
  keys = require("core.keymaps").ToggleTerm,
  config = function()
    local toggleterm = require "toggleterm"
    toggleterm.setup {
      size = 20,
      open_mapping = [[<F5>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = "/usr/bin/fish",
      float_opts = {
        border = "single",
      },
    }

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end
  end,
}
