-- My plugins here
local plugins = {
  -- Plugins dependencies
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins.configs.catppuccin")
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Todo comment
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({
        keywords = {
          FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = "󰠰 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = "󱞁 ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
      })
    end,
  },

  -- Nvim-surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Comment
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    config = function()
      require("mini.comment").setup()
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "catppuccin/nvim",
        name = "catppuccin",
      },
    },
    config = function()
      require("plugins.configs.bufferline")
    end,
  },

  -- Enable LSP support
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      require("plugins.configs.lspconfig")
    end,
  },

  -- Better lsp signature
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      close_timeout = 1000,
      floating_window_off_x = 0,
      floating_window_off_y = 0,
      handler_opts = {
        border = "rounded",
      },
    },
  },

  -- LSP, formatters, linters, debug adapters installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "󰗠 ",
          package_pending = " ",
          package_uninstalled = " ",
        },
      },
    },
  },

  -- Autoinstall LSP
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = require("lsp.servers"),
    },
  },

  -- LSP icon in winbar
  {
    "SmiteshP/nvim-navic",
    opts = {
      highlight = true,
      separator = "   ",
    },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },

  -- LSP status
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    tag = "legacy",
    opts = {
      window = {
        blend = 0,
      },
      text = {
        spinner = { "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" },
        done = "",
      },
      timer = {
        spinner_rate = 200,
      },
    },
  },

  -- Formatter, Linter, Code actions,...
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.configs.null_ls")
    end,
  },

  -- Better LSP
  {
    "nvimdev/lspsaga.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.lspsaga")
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- Auto completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("plugins.configs.cmp")
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      enable_check_bracket_line = true,
      check_ts = true,
      disable_filetype = { "TelescopePrompt" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    },
  },

  -- Indent line
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      show_trailing_blankline_indent = false,
      use_treesitter = true,
      char = "▏",
      context_char = "▏",
      show_current_context = true,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "startify",
        "aerial",
        "alpha",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "neo-tree",
        "Trouble",
      },
    },
  },

  -- Illuminate
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
    config = function()
      require("plugins.configs.illuminate")
    end,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.gitsigns")
    end,
  },

  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<F2>", "<cmd>Neotree<cr>" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("plugins.configs.neotree")
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.lualine")
    end,
  },

  -- Better diagnostics navigation
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>ld", "<cmd>TroubleToggle<cr>" },
    },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<F5>", "<cmd>ToggleTerm<cr>" },
    },
    config = function()
      require("plugins.configs.toggleterm")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter")
    end,
  },
}

-- lazy.nvim config
local opts = {
  defaults = { lazy = true, version = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
        "editorconfig",
      },
    },
  },
}

require("lazy").setup(plugins, opts)
