return {
  {
    "onsails/lspkind.nvim",
    opts = {},
    config = function(_, opts) require("lspkind").init(opts) end,
  },

  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      region_check_events = "CursorMoved",
    },
    config = function(_, opts) require("luasnip").config.setup(opts) end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    opts = function()
      local cmp = require("cmp")
      local cmp_action = require("lsp-zero").cmp_action()
      require("lsp-zero").extend_cmp()
      local lsnip_ok, luasnip = pcall(require, "luasnip")
      if not lsnip_ok then return end
      local lspkind_ok, lspkind = pcall(require, "lspkind")
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

        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          -- Confirm completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- Scroll up and down the documentation window
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
          ["<Tab>"] = cmp_action.luasnip_supertab(),
          ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "nvim_lua" },
        }),
        formatting = {
          fields = { "abbr", "menu", "kind" },
          format = lspkind_ok and lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        experimental = {
          ghost_text = true,
        },
      }
    end,
  },
}
