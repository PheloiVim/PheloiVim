return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      {
        "<tab>",
        function() return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>" end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function() require("luasnip").jump(1) end,
        mode = "s",
      },
      {
        "<s-tab>",
        function() require("luasnip").jump(-1) end,
        mode = { "i", "s" },
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded",
          }),
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<TAB>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "path", priority = 500 },
          { name = "buffer", priority = 250 },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("icons").kinds
            if icons[item.kind] then item.kind = icons[item.kind] .. item.kind end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },
}
