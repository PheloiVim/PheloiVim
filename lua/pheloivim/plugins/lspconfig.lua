return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    dependencies = {
      "williamboman/mason.nvim",
      { "williamboman/mason-lspconfig.nvim", cmd = { "LspInstall", "LspUninstall" }, opts = {} },
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
      servers = {},
      setup = {},
      capabilities = {
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = true,
              resolveSupport = {
                properties = { "documentation", "detail", "additionalTextEdits" },
              },
              documentationFormat = { "markdown", "plaintext" },
              preselectSupport = true,
              insertReplaceSupport = true,
              labelDetailsSupport = true,
              deprecatedSupport = true,
              commitCharactersSupport = true,
              tagSupport = { valueSet = { 1 } },
            },
          },
        },
      },
    },
    config = function(_, opts)
      for _, name in ipairs({ "Error", "Warn", "Hint", "Info" }) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = " ", texthl = name, numhl = "" })
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

      local function setup(server)
        local function load_mapping(map_table, bufnr)
          for mode, keymaps in pairs(map_table) do
            for key, keymap_opts in pairs(keymaps) do
              vim.keymap.set(mode, key, keymap_opts.cmd, { buffer = bufnr, desc = keymap_opts.desc })
            end
          end
        end

        local mapping = {
          n = {
            ["<leader>ca"] = { cmd = "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
            ["<leader>cp"] = { cmd = "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
            ["gd"] = { cmd = "<cmd>Lspsaga peek_definition<cr>", desc = "Go to definition" },
            ["K"] = { cmd = "<cmd>Lspsaga hover_doc<cr>", desc = "Hover" },
            ["<leader>cr"] = { cmd = "<cmd>Lspsaga rename<cr>", desc = "Rename" },
            ["<leader>cl"] = { cmd = "<cmd>LspInfo<cr>", desc = "Lsp Info" },
          },
        }

        if opts.servers[server].keys then
          for mode, keymaps in pairs(opts.servers[server].keys) do
            mapping[mode] = vim.tbl_deep_extend("force", mapping[mode], keymaps)
          end
        end

        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            if require("lspconfig").util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd()) then
              if client.name == "tsserver" then client.stop() end
            end
            load_mapping(mapping, bufnr)
          end,
        }, opts.servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server_opts) then return end
        end

        require("lspconfig")[server].setup(server_opts)
      end

      local ensure_installed = {} ---@type string[]
      for server, _ in pairs(opts.servers) do
        vim.list_extend(ensure_installed, { server })
        setup(server)
      end

      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      if have_mason then mlsp.setup({ ensure_installed = ensure_installed }) end
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
      lightbulb = {
        enable_in_insert = true,
        virtual_text = true,
        sign = false,
      },
    },
  },

  {
    "piersolenski/wtf.nvim",
    cmd = { "WtfSearch", "Wtf" },
    opts = {},
  },
}
