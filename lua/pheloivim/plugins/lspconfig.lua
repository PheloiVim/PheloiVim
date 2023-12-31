return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    keys = {
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
    },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = true,
        signs = true,
        severity_sort = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
      },
      servers = {
        lua_ls = {},
      },
    },
    config = function(_, opts)
      for name, icon in pairs(require("pheloivim.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)

      for server, server_opts in pairs(opts.servers) do
        require("lspconfig")[server].setup(server_opts)
      end
    end,
  },
}
