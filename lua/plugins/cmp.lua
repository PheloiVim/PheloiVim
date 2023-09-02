return {
  {
    "L3MON4D3/LuaSnip",
    opts = {
      region_check_events = "InsertEnter",
      delete_check_events = "TextChanged,InsertLeave",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      require("luasnip/loaders/from_vscode").lazy_load()
      opts.window = {
        completion = { border = "solid" },
        documentation = { border = "solid" },
      }
      opts.mapping = require("cmp").mapping.preset.insert {
        ["<C-j>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Insert },
        ["<C-k>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Insert },
        ["<C-u>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-d>"] = require("cmp").mapping.scroll_docs(4),
        ["<TAB>"] = require("cmp").mapping.confirm { select = true },
      }
    end,
  },
}
