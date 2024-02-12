return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "codelldb" }) end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "rust", "toml" }) end,
  },

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
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "crates" },
      }))
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          keys = {
            n = {
              ["K"] = { cmd = "<cmd>RustLsp hover actions<cr>", desc = "Rust hover" },
              ["<leader>dR"] = { cmd = function() vim.cmd.RustLsp("debuggables") end, desc = "Run Debuggables (Rust)" },
            },
          },
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
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
    dependencies = "rouge8/neotest-rust",
    opts = function(_, opts) vim.list_extend(opts.adapters, { require("neotest-rust") }) end,
  },
}
