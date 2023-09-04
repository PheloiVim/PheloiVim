return {
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      region_check_events = "InsertEnter,CursorMoved",
      delete_check_events = "TextChanged,InsertLeave",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      require("luasnip.loaders.from_snipmate").lazy_load()
      local cmp = require "cmp"
      opts.window = {
        completion = cmp.config.window.bordered {
          border = "rounded",
        },
        documentation = cmp.config.window.bordered {
          border = "rounded",
        },
      }
      opts.mapping = cmp.mapping.preset.insert {
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<TAB>"] = cmp.mapping.confirm { select = true },
      }
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", keyword_length = 2, priority = 1000 },
        { name = "luasnip", keyword_length = 2, priority = 750 },
        { name = "buffer", keyword_length = 2, priority = 500 },
        { name = "path", keyword_length = 2, priority = 250 },
      }
    end,
  },
}
