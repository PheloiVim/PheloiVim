return {
  -- Better text-objects
  { "echasnovski/mini.ai", event = "VeryLazy", opts = {} },

  -- Go forward/backward with square brackets
  { "echasnovski/mini.bracketed", event = "VeryLazy", opts = {} },

  -- Common configuration presets for options, mappings, and autocommands
  {
    "echasnovski/mini.basics",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      options = {
        -- Basic options ('number', 'ignorecase', and many more)
        basic = true,

        -- Extra UI features ('winblend', 'cmdheight=0', ...)
        extra_ui = true,

        -- Presets for window borders ('single', 'double', ...)
        win_borders = "rounded",
      },

      mappings = {
        -- Basic mappings (better 'jk', save with Ctrl+S, ...)
        basic = true,

        -- Window navigation with <C-hjkl>, resize with <C-arrow>
        windows = true,

        -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
        -- Supply empty string to not create these mappings.
        option_toggle_prefix = [[\]],

        -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
        move_with_alt = false,
      },

      autocommands = {
        -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
        basic = true,

        -- Set 'relativenumber' only in linewise and blockwise Visual mode
        relnum_in_visual_mode = false,
      },

      -- Whether to disable showing non-error feedback
      silent = true,
    },
  },

  -- Buffer remove
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },

  -- Indent line
  {
    "echasnovski/mini.indentscope",
    event = "VeryLazy",
    opts = {},
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "dashboard",
          "lazy",
          "neo-tree",
          "Trouble",
          "trouble",
          "toggleterm",
          "mason",
        },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
    end,
  },

  -- Move any selection in any direction
  {
    "echasnovski/mini.move",
    keys = {
      { "<A-h>", mode = "n", desc = "Move line left" },
      { "<A-j>", mode = "n", desc = "Move line down" },
      { "<A-k>", mode = "n", desc = "Move line up" },
      { "<A-l>", mode = "n", desc = "Move line right" },
      { "<", mode = "v", desc = "Move selection left" },
      { "<A-j>", mode = "v", desc = "Move selection down" },
      { "<A-k>", mode = "v", desc = "Move selection up" },
      { ">", mode = "v", desc = "Move selection right" },
    },
    opts = {
      mappings = {
        -- Move visual selection in Visual mode.
        left = "<",
        right = ">",
        down = "<A-j>",
        up = "<A-k>",

        -- Move current line in Normal mode
        line_left = "<A-h>",
        line_right = "<A-l>",
        line_down = "<A-j>",
        line_up = "<A-k>",
      },
    },
  },
}
