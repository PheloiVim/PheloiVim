return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    init = function()
      -- Disable automatic setup, doing it manually
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
      -- Diagnostic options
      diagnostic = {
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      },
      -- LSP servers configuration
      servers = {
        lua_ls = {},
      },
      -- Additional setup for the LSP server can be performed here.
      -- If you want to skip setting up this server with lspconfig,
      -- return true from this function.
      setup = {
        -- Example with `rustaceanvim`
        -- rust_analyzer = function(opts)
        --   vim.g.rustaceanvim = {
        --     server = vim.tbl_deep_extend("force", {}, opts),
        --   }
        --   return true
        -- end,
      },
    },
    config = function(_, opts)
      local lsp_zero = require("lsp-zero")
      -- Extend nvim-lspconfig with lsp-zero features
      lsp_zero.extend_lspconfig()

      -- Use icons in the sign column for diagnostics
      lsp_zero.set_sign_icons(require("icons").diagnostic)

      -- Configure diagnostics
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

      -- Setup LSP server
      local ensure_installed = {} ---@type string[]
      local handlers = { lsp_zero.default_setup }
      for server, server_opts in pairs(opts.servers) do
        -- Add the server to the list of servers to ensure installation
        table.insert(ensure_installed, server)

        -- Check if a custom setup function is provided for this server
        if opts.setup[server] then
          -- Execute the custom setup function
          if opts.setup[server](server_opts) then
            -- If the custom setup function returns true, skip automatic setup and use 'noop' function from 'lsp-zero'
            handlers = vim.tbl_deep_extend("force", handlers, {
              [server] = lsp_zero.noop,
            })
          end
        else
          -- If no custom setup function is provided, use the default configuration for the LSP server
          lsp_zero.configure(server, server_opts)
        end
      end
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        handlers = handlers,
      })
    end,
  },
}
