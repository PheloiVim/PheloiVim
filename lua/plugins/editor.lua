return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "plenary.nvim",
      "3rd/image.nvim", -- Image support in preview window
      "nui.nvim",
      "nvim-web-devicons",
    },
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then require("neo-tree") end
      end
    end,
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree" },
    },
    opts = {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      sources = { "filesystem" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        width = 35,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          ["l"] = "open",
        },
      },
    },
  },
}
