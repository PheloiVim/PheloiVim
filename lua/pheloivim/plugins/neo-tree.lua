return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>e",
      function() require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() }) end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<leader>be",
      function() require("neo-tree.command").execute({ source = "buffers", toggle = true }) end,
      desc = "Buffer explorer",
    },
  },
  init = function()
    if vim.fn.argc(-1) == 1 then
      ---@diagnostic disable-next-line: param-type-mismatch
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then require("neo-tree") end
    end
  end,
  opts = {
    auto_clean_after_session_restore = true,
    popup_border_style = "rounded",
    close_if_last_window = true,
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = false },
      use_libuv_file_watcher = true,
    },
    window = {
      mappings = {
        ["<space>"] = false, -- disable space until we figure out which-key disabling
        l = "open",
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        indent_size = 2,
        with_markers = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = {
        symbols = require("pheloivim.icons").git,
      },
    },
  },
}
