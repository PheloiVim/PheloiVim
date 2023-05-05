return {
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
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    require("luasnip/loaders/from_vscode").lazy_load()

    local lsp_icons = {
      Namespace = "",
      Text = "󰊄",
      Method = "",
      Function = "󰊕",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "󰠠",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "󰈔",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
      Table = "",
      Object = "",
      Tag = "",
      Array = "[]",
      Boolean = "",
      Number = "",
      Null = "󰟢",
      String = "󰅳",
      Calendar = "",
      Watch = "",
      Package = "",
      Copilot = "",
    }

    cmp.setup {
      completion = { completeopt = "menu,menuone,noinsert" },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = { border = "solid" },
        documentation = { border = "solid" },
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
        ["<C-e>"] = cmp.mapping.abort(),
      },
    }

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      formatting = { fields = { "abbr" } },
      completion = { completeopt = "menu,menuone,noinsert,noselect" },
      window = {
        completion = { border = "solid" },
      },
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      formatting = { fields = { "abbr" } },
      window = {
        completion = { border = "solid" },
      },
      completion = { completeopt = "menu,menuone,noinsert,noselect" },
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
