return {
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      require("luasnip/loaders/from_vscode").lazy_load()

      local lsp_icons = {
        Namespace = "",
        Text = " ",
        Method = " ",
        Function = "﬘ ",
        Constructor = " ",
        Field = "ﰠ ",
        Variable = " ",
        Class = "ﴯ ",
        Interface = " ",
        Module = " ",
        Property = "ﰠ ",
        Unit = "塞 ",
        Value = " ",
        Enum = " ",
        Keyword = " ",
        Snippet = " ",
        Color = " ",
        File = " ",
        Reference = " ",
        Folder = " ",
        EnumMember = " ",
        Constant = " ",
        Struct = "פּ ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
        Table = "",
        Object = " ",
        Tag = "",
        Array = "[]",
        Boolean = " ",
        Number = " ",
        Null = "ﳠ",
        String = " ",
        Calendar = "",
        Watch = " ",
        Package = "",
        Copilot = " ",
      }

      cmp.setup {
        completion = {
          completeopt = "menu,menuone",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          fields = { "abbr", "kind" },
          format = function(_, vim_item)
            vim_item.kind = string.format("%s %s", lsp_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end,
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<TAB>"] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Replace },
          ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },
        },
      }
    end,
  },
}
