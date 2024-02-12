return {
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
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "K", function() vim.cmd("RustLsp hover actions") end, { buffer = bufnr, desc = "Rust hover" })
            vim.keymap.set("n", "<leader>dR", function() vim.cmd.RustLsp("debuggables") end, { buffer = bufnr, desc = "Run Debuggables (Rust)" })
          end,
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
    dependencies = "mrcjkb/rustaceanvim",
    opts = function(_, opts) vim.list_extend(opts.adapters, { require("rustaceanvim.neotest") }) end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "codelldb" }) end,
  },
}
