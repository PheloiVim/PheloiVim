return {
  "akinsho/toggleterm.nvim",
  keys = require("core.keymaps").ToggleTerm,
  init = function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float", size = 40 }
    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end
  end,
  opts = function()
    return {
      size = 15,
      open_mapping = [[<F5>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      shell = "/usr/bin/fish",
      float_opts = {
        border = "single",
      },
    }
  end,
}
