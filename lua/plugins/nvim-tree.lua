return {
  "nvim-tree/nvim-tree.lua",
  keys = require("core.keymaps").NvimTree,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local tree_cb = require("nvim-tree.config").nvim_tree_callback
    require("nvim-tree").setup {
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = false,
      },
      view = {
        adaptive_size = false,
        width = 30,
        side = "left",
        hide_root_folder = true,
        mappings = {
          list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            { key = "h", cb = tree_cb "close_node" },
            { key = "v", cb = tree_cb "vsplit" },
          },
        },
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      filesystem_watchers = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    }
  end,
}
