return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" }) end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      require("pheloivim.utils").install_package("markdownlint")
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft, {
        markdown = { "markdownlint" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          headline_highlights = {},
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      require("pheloivim.utils").install_package("prettier")
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        markdown = { "prettier" },
      })
    end,
  },
}
