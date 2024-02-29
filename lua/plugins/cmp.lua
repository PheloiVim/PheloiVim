return {
  {
    "L3MON4D3/LuaSnip",
    build = vim.fn.has("win32") ~= 0 and "make install_jsregexp",
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      region_check_events = "CursorMoved",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    opts = function()
      local cmp = require("cmp")
      local cmp_action = require("lsp-zero").cmp_action()
      require("lsp-zero").extend_cmp()
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      require("luasnip.loaders.from_vscode").lazy_load()

      return {
        -- Adding borders to completion menu
        window = {
          completion = cmp.config.window.bordered({ border = "rounded" }),
          documentation = cmp.config.window.bordered({ border = "rounded" }),
        },
        -- Make the first item in completion menu always be selected.
        preselect = "item",
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.confirm(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4, { "i", "c" }),
          ["<C-d>"] = cmp.mapping.scroll_docs(4, { "i", "c" }),
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable,
          ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          fields = { "abbr", "menu", "kind" },
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        experimental = {
          ghost_text = false,
        },
      }
    end,
  },
}
