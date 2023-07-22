return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require "cmp"
    local defaults = require "cmp.config.default"()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    return {
      completion = { completeopt = "menu,menuone,noinsert" },
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },
      window = {
        completion = { border = "rounded" },
        documentation = { border = "rounded" },
      },
      formatting = {
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then item.kind = icons[item.kind] .. item.kind end
          return item
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
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
}
