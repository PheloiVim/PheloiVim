return {
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {
      auto_enable = true,
      magic_window = true,
      auto_resize_height = true,
      preview = {
        auto_preview = true,
        show_title = true,
        delay_syntax = 50,
        wrap = false,
      },
    },
  },

  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
      {
        "<leader>sw",
        mode = "v",
        function() require("spectre").open_visual() end,
        desc = "Search current word (Spectre)",
      },
    },
  },

  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "e", mode = { "n", "o", "x" }, function() require("spider").motion("e") end },
      { "w", mode = { "n", "o", "x" }, function() require("spider").motion("w") end },
      { "b", mode = { "n", "o", "x" }, function() require("spider").motion("b") end },
      { "ge", mode = { "n", "x", "o" }, function() require("spider").motion("ge") end },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "johmsalas/text-case.nvim",
    keys = {
      { "ga", mode = "v", desc = "Text case" },
    },
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    keys = {
      { "<leader>xt", vim.cmd.TodoQuickFix, desc = "Todo list" },
      { "<leader>st", vim.cmd.TodoTelescope, desc = "Todo list (Telescope)" },
    },
  },

  {
    "Wansmer/treesj",
    keys = {
      { "<leader>m", vim.cmd.TSJToggle, desc = "Toggle node under cursor" },
      { "<leader>s", vim.cmd.TSJSplit, desc = "Split node under cursor" },
      { "<leader>j", vim.cmd.TSJJoin, desc = "Join node under cursor" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
  },
}
