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
      local cmp = require("cmp")
      opts.window = {
        completion = { border = "solid" },
        documentation = { border = "solid" },
      }
      opts.mapping = cmp.mapping.preset.insert {
        ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<TAB>"] = cmp.mapping.confirm { select = true },
      }
    end,
  },
}
