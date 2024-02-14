-- File explorer
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
      desc = "Neotree (cwd)",
    },
    {
      "<leader>E",
      function() require("neo-tree.command").execute({ toggle = true, dir = require("utils").root_dir(".git") }) end,
      desc = "Neotree (root)",
    },
  },
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then require("neo-tree") end
    end
  end,
  opts = {
    auto_clean_after_session_restore = true,
    popup_border_style = "rounded",
    close_if_last_window = true,
    sources = { "filesystem" },
    filesystem = {
      bind_to_cwd = false,
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
        padding = 0,
      },
      git_status = {
        symbols = require("pheloivim.icons").git,
      },
    },
  },
}
