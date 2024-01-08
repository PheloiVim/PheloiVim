return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "rust", "toml" }) end,
  },

  -- Extend auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {
          src = {
            cmp = { enabled = true },
          },
        },
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "crates" },
      }))
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        rust = { "rustfmt" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          keys = {
            n = {
              ["K"] = { cmd = "<cmd>RustLsp hover actions<cr>", desc = "Rust hover" },
              ["<leader>cR"] = { cmd = function() vim.cmd.RustLsp("codeAction") end, desc = "Code Action (Rust)" },
              ["<leader>dr"] = { cmd = function() vim.cmd.RustLsp("debuggables") end, desc = "Run Debuggables (Rust)" },
            },
          },
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
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
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "rouge8/neotest-rust",
    },
    opts = function(_, opts) vim.list_extend(opts.adapters, { require("neotest-rust") }) end,
  },
}
