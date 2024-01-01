return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    keys = {
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
    },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      "williamboman/mason.nvim",
      "ray-x/lsp_signature.nvim",
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

      for server, server_opts in pairs(opts.servers) do
        require("pheloivim.utils").install_package(server)
        server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
          on_attach = function(client, bufnr)
            local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc }) end
            map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", "Code action")
            map("n", "<leader>cp", "<cmd>Lspsaga peek_definition<cr>", "Peek definition")
            map("n", "gd", "<cmd>Lspsaga goto_definition<cr>", "Go to definition")
            map("n", "K", "<cmd>Lspsaga hover_doc<cr>", "Hover")
            map("n", "<leader>cr", "<cmd>Lspsaga rename<cr>", "Rename")

            require("lsp_signature").on_attach({
              bind = true,
              handler_opts = {
                border = "rounded",
              },
            }, bufnr)

            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        }, server_opts)
        require("lspconfig")[server].setup(server_opts)
      end
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = { "LspAttach", "VeryLazy" },
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
