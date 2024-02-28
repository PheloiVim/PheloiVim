return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0

      vim.b.lsp_zero_enable_autoformat = 0
      vim.g.lsp_zero_ui_float_border = 0
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "VonHeikemen/lsp-zero.nvim",
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      { "folke/neodev.nvim", opts = {} },
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostic = {
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      },
      servers = {
        lua_ls = {}, --TODO: remove later
      },
      setup = {},
    },
    config = function(_, opts)
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      -- Use icons in the sign column
      lsp_zero.set_sign_icons(require("icons").diagnostic)

      -- Diagnostic
      vim.diagnostic.config(opts.diagnostic)

      -- Setup server
      local ensure_installed = {}
      local handlers = { lsp_zero.default_setup }
      for server, server_opts in pairs(opts.servers) do
        vim.list_extend(ensure_installed, { server })
        if opts.setup[server] then
          if opts.setup[server](server_opts) then handlers = vim.tbl_deep_extend("force", handlers, {
            [server] = lsp_zero.noop,
          }) end
        else
          handlers = vim.tbl_deep_extend("force", handlers, {
            [server] = function() require("lspconfig")[server].setup(server_opts) end,
          })
        end
      end
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        handlers = handlers,
      })
    end,
  },
}
