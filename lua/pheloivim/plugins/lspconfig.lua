return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    dependencies = {
      "williamboman/mason.nvim",
      {
        "ray-x/lsp_signature.nvim",
        opts = {
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          handler_opts = {
            border = "rounded",
          },
        },
      },
      { "williamboman/mason-lspconfig.nvim", cmd = { "LspInstall", "LspUninstall" }, opts = {} },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("pheloivim.icons").diagnostics.Error,
            [vim.diagnostic.severity.WARN] = require("pheloivim.icons").diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = require("pheloivim.icons").diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = require("pheloivim.icons").diagnostics.Info,
          },
        },
        severity_sort = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "",
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
            ["K"] = { cmd = require("hover").hover, desc = "Hover" },
            ["<leader>cr"] = { cmd = "<cmd>Lspsaga rename<cr>", desc = "Rename" },
            ["<leader>cl"] = { cmd = "<cmd>LspInfo<cr>", desc = "Lsp Info" },
            ["]d"] = { cmd = "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next diagnostic" },
            ["[d"] = { cmd = "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous diagnostic" },
            ["<leader>co"] = { cmd = "<cmd>Lspsaga outline<cr>", desc = "Code outline" },
          },
        }

        if opts.servers[server].keys then
          for mode, keymaps in pairs(opts.servers[server].keys) do
            mapping[mode] = vim.tbl_deep_extend("force", mapping[mode], keymaps)
          end
        end

        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = function(_, bufnr) load_mapping(mapping, bufnr) end,
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

      -- Auto disable denols or tsserver
      local is_deno = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true, stop = vim.loop.os_homedir() })[1]
      local is_node = vim.fs.find({ "package.json" }, { upward = true, stop = vim.loop.os_homedir() })[1]
      local function disable(server)
        local configs = require("lspconfig.configs")
        local def = rawget(configs, server)
        def.document_config.on_new_config = require("lspconfig.util").add_hook_before(
          def.document_config.on_new_config,
          function(config) config.enabled = false end
        )
      end
      if is_deno then
        disable("tsserver")
      elseif is_node then
        disable("denols")
      end
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
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

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = {
      sources = {},
    },
  },

  {
    "lewis6991/hover.nvim",
    event = "LspAttach",
    opts = {
      init = function()
        require("hover.providers.lsp")
        require("hover.providers.gh")
        require("hover.providers.gh_user")
        -- require('hover.providers.jira')
        require("hover.providers.man")
        require("hover.providers.dictionary")
      end,
      preview_opts = {
        border = "rounded",
      },
    },
  },
}
