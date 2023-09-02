return {
  "hrsh7th/nvim-cmp",
  opts = {
    window = {
      completion = { border = "solid" },
      documentation = { border = "solid" },
    },
    mapping = {
      ["<Up>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Select },
      ["<Down>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Select },
      ["<C-k>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Insert },
      ["<C-j>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Insert },
      ["<C-u>"] = require("cmp").mapping(require("cmp").mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-d>"] = require("cmp").mapping(require("cmp").mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = require("cmp").mapping(require("cmp").mapping.complete(), { "i", "c" }),
      ["<C-e>"] = require("cmp").mapping { i = require("cmp").mapping.abort(), c = require("cmp").mapping.close() },
      ["<TAB>"] = require("cmp").mapping.confirm { select = false },
    },
  },
}
