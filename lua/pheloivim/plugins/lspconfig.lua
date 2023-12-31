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
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      for name, icon in pairs(require("pheloivim.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)
      require("lspconfig.ui.windows").default_options.border = "rounded"

      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local ensure_installed = {} ---@type string[]

      for server, server_opts in pairs(opts.servers) do
        table.insert(ensure_installed, server)
        server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, server_opts)
        require("lspconfig")[server].setup(server_opts)
      end

      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed })
      end
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = { "LspAttach", "VeryLazy" },
    keys = {
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
      { "<leader>cp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover" },
      { "<leader>cr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
    },
    opts = {
      ui = {
        code_action = "",
      },
      symbol_in_winbar = {
        show_file = false,
      },
      code_action = {
        show_server_name = true,
      },
    },
  },
}
