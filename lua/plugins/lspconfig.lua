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
        lua_ls = {},
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

      lsp_zero.on_attach(function(_, bufnr)
        -- Setup keymaps
        lsp_zero.default_keymaps({
          buffer = bufnr,
          exclude = { "gd", "<F2>", "<F3>", "<F4>", "gl", "[d", "]d" },
        })
        local function map(l, r, desc) vim.keymap.set("n", l, r, { buffer = bufnr, desc = desc }) end
        map("<leader>ca", function() vim.cmd("Lspsaga code_action") end, "Code action")
        map("<leader>cp", function() vim.cmd("Lspsaga peek_definition") end, "Peek definition")
        map("<leader>cr", function() vim.cmd("Lspsaga rename") end, "LSP rename")
        map("<leader>co", function() vim.cmd("Lspsaga outline") end, "Code outline")
        map("]d", function() vim.cmd("Lspsaga diagnostic_jump_next") end, "Next diagnostic")
        map("[d", function() vim.cmd("Lspsaga diagnostic_jump_prev") end, "Previous diagnostic")
        map("gd", function() vim.cmd("Lspsaga goto_definition") end, "Go to definition")
      end)

      -- Setup server
      local ensure_installed = {}
      local handlers = { lsp_zero.default_setup }
      for server, server_opts in pairs(opts.servers) do
        vim.list_extend(ensure_installed, { server })

        if opts.setup[server] then
          if opts.setup[server](server_opts) then
            handlers = vim.tbl_deep_extend("force", handlers, {
              [server] = lsp_zero.noop,
            })
          end
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
