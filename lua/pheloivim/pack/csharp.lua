return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "c_sharp" }) end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      require("pheloivim.utils").install_formatter("csharpier")

      opts.formatters_by_ft = {
        cs = { "csharpier" },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "Hoffs/omnisharp-extended-lsp.nvim",
    opts = {
      servers = {
        omnisharp = {
          handlers = {
            ["textDocument/definition"] = function(...) return require("omnisharp_extended").handler(...) end,
          },
          keys = {
            n = {
              ["gd"] = { cmd = function() require("omnisharp_extended").telescope_lsp_definitions() end, desc = "Goto Definition" },
            },
          },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = "Issafalcon/neotest-dotnet",
    opts = function(_, opts) vim.list_extend(opts.adapters, { require("neotest-dotnet") }) end,
  },
}
