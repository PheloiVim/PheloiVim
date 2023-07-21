return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    require("luasnip/loaders/from_vscode").lazy_load()

    local lsp_icons = {
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
    }
    return {
      completion = { completeopt = "menu,menuone,noinsert" },
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      window = {
        completion = { border = "rounded" },
        documentation = { border = "rounded" },
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(_, vim_item)
          vim_item.kind = string.format("%s %s", lsp_icons[vim_item.kind], vim_item.kind)
          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "buffer", priority = 750 },
        { name = "path", priority = 500 },
        { name = "luasnip", priority = 250 },
      },
      mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
        ["<TAB>"] = cmp.mapping.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace },
      },
    }
  end,
}
