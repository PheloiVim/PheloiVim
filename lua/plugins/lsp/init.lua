return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      { "folke/neodev.nvim", opts = {} },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = true,
        signs = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
              workspace = {
                checkThirdParty = false,
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
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
      local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities())
      capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
      }

      for name, icon in pairs(require("icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers

      local function lsp_keymaps(bufnr)
        local keymap_opts = { noremap = true, silent = true }
        local keymap = vim.api.nvim_buf_set_keymap
        keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", keymap_opts)
        keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keymap_opts)
        keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keymap_opts)
        keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", keymap_opts)
        keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", keymap_opts)
        keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", keymap_opts)
        keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", keymap_opts)
        keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", keymap_opts)
        keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", keymap_opts)
        keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", keymap_opts)
        keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", keymap_opts)
        keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", keymap_opts)
        keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", keymap_opts)
        keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", keymap_opts)
      end

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
          on_attach = function(client, bufnr)
            lsp_keymaps(bufnr)
            require("illuminate").on_attach(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            if client.server_capabilities.documentSymbolProvider then require("nvim-navic").attach(client, bufnr) end
          end,
        }, servers[server] or {})
        require("lspconfig")[server].setup(server_opts)
      end

      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          setup(server)
        end
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "󰗠 ",
          package_pending = " ",
          package_uninstalled = " ",
        },
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "bashls",
      },
    },
  },

  {
    "SmiteshP/nvim-navic",
    opts = {
      highlight = true,
    },
  },
}
