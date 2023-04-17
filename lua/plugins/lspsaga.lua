return {
  "glepnir/lspsaga.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      diagnostic = {
        on_insert = false,
        on_insert_follow = false,
        show_virt_line = false,
        show_code_action = false,
      },
      outline = {
        win_width = 40,
        keys = {
          jump = "o",
          expand_collapse = "u",
          quit = "q",
        },
      },
      symbol_in_winbar = {
        separator = "  ",
        show_file = false,
      },
    }
  end,
}
