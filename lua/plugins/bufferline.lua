return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    return {
      options = {
        numbers = "none",
        left_mouse_command = "buffer %d",
        buffer_close_icon = "✗",
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        color_icons = true,
        offsets = { { filetype = "NvimTree", text = "Explorer", padding = 1, separator = true } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
      },
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
    }
  end,
}
