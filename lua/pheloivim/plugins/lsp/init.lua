return {
  {
    "piersolenski/wtf.nvim",
    cmd = { "WtfSearch", "Wtf" },
    opts = {},
  },

  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      sources = {},
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      rename = {
        keys = {
          quit = "<ESC>",
        },
      },
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
    "ray-x/lsp_signature.nvim",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "ray-x/lsp_signature.nvim",
      "nvimdev/lspsaga.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
    },
    opts = {
      servers = {},
      setup = {},
    },
    config = function(_, opts)
      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(_, bufnr)
        -- Setup keymaps
        lsp_zero.default_keymaps({ buffer = bufnr, exclude = { "gd", "<F2>", "<F3>", "<F4>", "gl", "[d", "]d" } })
        local default_keymaps = {
          { "<leader>ca", function() vim.cmd("Lspsaga code_action") end, "Code Action" },
          { "<leader>cd", function() vim.cmd("Lspsaga peek_definition") end, "Peek Definition" },
          { "<leader>cr", function() vim.cmd("Lspsaga rename") end, "LSP Rename" },
          { "<leader>co", function() vim.cmd("Lspsaga outline") end, "Code Outline" },
          { "]d", function() vim.cmd("Lspsaga diagnostic_jump_next") end, "Next Diagnostic" },
          { "[d", function() vim.cmd("Lspsaga diagnostic_jump_prev") end, "Previous Diagnostic" },
          { "<leader>cl", function() vim.cmd("LspInfo") end, "Lsp Info" },
        }
        for _, opt in ipairs(default_keymaps) do
          vim.keymap.set("n", opt[1], opt[2], { buffer = bufnr, desc = opt[3] })
        end
      end)

      -- Use icons in the sign column
      lsp_zero.set_sign_icons({
        error = " ",
        warn = " ",
        hint = " ",
        info = "»",
      })

      -- Disable formatting capabilities
      lsp_zero.set_server_config({
        on_init = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentFormattingRangeProvider = false
        end,
      })

      -- Setup server
      local ensure_installed = {} ---@type string[]
      local function setup(server, server_opts)
        if opts.setup[server] then
          if opts.setup[server](server_opts) then return end
        end

        require("lspconfig")[server].setup(server_opts)
      end
      for server, server_opts in pairs(opts.servers) do
        vim.list_extend(ensure_installed, { server })
        setup(server, server_opts)
      end
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })

      -- Auto disable denols or tsserver
      local utils = require("pheloivim.plugins.lsp.utils")
      local is_deno = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true, stop = vim.loop.os_homedir() })[1]
      local is_node = vim.fs.find({ "package.json" }, { upward = true, stop = vim.loop.os_homedir() })[1]
      if is_deno then
        utils.disable("tsserver")
      elseif is_node then
        utils.disable("denols")
      end
    end,
  },
}
