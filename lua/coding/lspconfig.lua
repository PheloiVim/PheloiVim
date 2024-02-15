return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "nvimdev/lspsaga.nvim",
    "VonHeikemen/lsp-zero.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    { "VidocqH/lsp-lens.nvim", opts = {} },
    "folke/neodev.nvim",
  },
  opts = {
    servers = {
      lua_ls = {},
      astro = {},
      bashls = {},
      omnisharp = { -- C#
        handlers = {
          ["textDocument/definition"] = function(...) return require("omnisharp_extended").handler(...) end,
        },
        enable_ms_build_load_projects_on_demand = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
      },
      graphql = {},
      nil_ls = {}, -- Nix
      gopls = {
        on_attach = function()
          vim.keymap.set(
            "n",
            "<leader>tD",
            function() require("dap-go").debug_test() end,
            { desc = "Debug Nearest (Go)" }
          )
        end,
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          fieldalignment = true,
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        semanticTokens = true,
      },
      html = {},
      clangd = {},
      dockerls = {},
      docker_compose_language_service = {},
      cssls = {},
      yamlls = {
        -- Have to add this for yamlls to understand that we support line folding
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
        -- lazy-load schemastore when needed
        on_new_config = function(new_config)
          new_config.settings.yaml.schemas =
            vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
        end,
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            keyOrdering = false,
            format = {
              enable = true,
            },
            validate = true,
            schemaStore = {
              -- Must disable built-in schemaStore support to use
              -- schemas from SchemaStore.nvim plugin
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = "",
            },
          },
        },
      },
      volar = {}, -- Vue.js
      tailwindcss = {},
      jsonls = {
        -- lazy-load schemastore when needed
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end,
        settings = {
          json = {
            format = {
              enable = true,
            },
            validate = { enable = true },
          },
        },
      },
      rust_analyzer = {
        on_attach = function(_, bufnr)
          vim.keymap.set(
            "n",
            "K",
            function() vim.cmd("RustLsp hover actions") end,
            { buffer = bufnr, desc = "Rust hover" }
          )
          vim.keymap.set(
            "n",
            "<leader>dR",
            function() vim.cmd.RustLsp("debuggables") end,
            { buffer = bufnr, desc = "Run Debuggables (Rust)" }
          )
        end,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      tsserver = {
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
      denols = {},
      biome = {},
      eslint = {
        settings = {
          workingDirectory = { mode = "auto" },
        },
      },
      taplo = {
        keys = {
          n = {
            ["K"] = {
              cmd = function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.cmd("Lspsaga hover_doc")
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
      },
    },
    setup = {
      rust_analyzer = function(opts)
        vim.g.rustaceanvim = {
          server = vim.tbl_deep_extend("force", {}, opts),
        }
        return true
      end,
    },
  },
  config = function(_, opts)
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(_, bufnr)
      -- Setup keymaps
      lsp_zero.default_keymaps({
        buffer = bufnr,
        exclude = { "gd", "<F2>", "<F3>", "<F4>", "gl", "[d", "]d" },
      })
      local default_keymaps = {
        { "<leader>ca", function() vim.cmd("Lspsaga code_action") end, "Code action" },
        { "<leader>cd", function() vim.cmd("Lspsaga peek_definition") end, "Peek definition" },
        { "<leader>cr", function() vim.cmd("Lspsaga rename") end, "LSP rename" },
        { "<leader>co", function() vim.cmd("Lspsaga outline") end, "Code outline" },
        { "]d", function() vim.cmd("Lspsaga diagnostic_jump_next") end, "Next diagnostic" },
        { "[d", function() vim.cmd("Lspsaga diagnostic_jump_prev") end, "Previous diagnostic" },
        { "<leader>cl", function() vim.cmd("LspInfo") end, "Lsp Info" },
        { "gd", function() vim.cmd("Lspsaga goto_definition") end, "Go to definition" },
      }
      for _, opt in ipairs(default_keymaps) do
        vim.keymap.set("n", opt[1], opt[2], { buffer = bufnr, desc = opt[3] })
      end
    end)

    -- Use icons in the sign column
    lsp_zero.set_sign_icons(require("pheloivim.icons").diagnostics)

    -- Disable formatting capabilities
    lsp_zero.set_server_config({
      on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
      end,
    })

    -- Setup server
    local function setup(server, server_opts)
      if opts.setup[server] then
        if opts.setup[server](server_opts) then return end
      end

      require("lspconfig")[server].setup(server_opts)
    end

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(opts.servers) do
      vim.list_extend(ensure_installed, { server })
      setup(server, server_opts)
    end

    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
    })

    -- Auto disable denols or tsserver
    local utils = require("utils")
    local is_deno = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true, stop = vim.loop.os_homedir() })[1]
    local is_node = vim.fs.find({ "package.json" }, { upward = true, stop = vim.loop.os_homedir() })[1]
    if is_deno then
      utils.disable("tsserver")
    elseif is_node then
      utils.disable("denols")
    end
  end,
}
