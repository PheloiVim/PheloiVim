return {
  -- Go forward/backward with square brackets
  {
    "echasnovski/mini.bracketed",
    keys = { "[", "]" },
    opts = {
      -- Supply empty string `''` to not create mappings.
      diagnostic = {
        suffix = "",
      },
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
      {
        "<leader>bD",
        function() require("mini.bufremove").delete(0, true) end,
        desc = "Delete Buffer (Force)",
      },
    },
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
