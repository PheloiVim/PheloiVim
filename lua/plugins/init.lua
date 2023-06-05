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
    opts = {
      flavour = "mocha",
      term_colors = true,
      integrations = {
        lsp_saga = true,
        cmp = true,
        gitsigns = true,
        telescope = false,
        fidget = true,
        treesitter = true,
        mason = true,
        illuminate = true,
        indent_blankline = {
          neotree = true,
          enabled = true,
          colored_indent_levels = false,
        },

        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        dap = {
          enabled = true,
          enable_ui = true,
        },
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
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

  -- Wakatime
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },

  -- Comment
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = true,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = require("plugins.configs.bufferline"),
  },

  -- Enable LSP support
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
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

  -- LSP icon in winbar
  {
    "SmiteshP/nvim-navic",
    event = "VeryLazy",
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
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },

  -- LSP status
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
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
    opts = require("plugins.configs.lspsaga"),
  },

  -- Auto completion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
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
      show_current_context_start = false,
      char = "▏",
      context_char = "▏",
      colored_indent_levels = true,
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      use_treesitter = true,
      show_current_context = true,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "neo-tree",
        "help",
        "lazy",
        "alpha",
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
    opts = require("plugins.configs.gitsigns"),
  },

  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-e>", "<cmd>Neotree<cr>" },
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
