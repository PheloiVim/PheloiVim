return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "nvimdev/lspsaga.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "VidocqH/lsp-lens.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
  },
  opts = {
    servers = {
      lua_ls = {},
    },
    setup = {},
  },
  config = function(_, opts)
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(_, bufnr)
      -- Setup keymaps
      lsp_zero.default_keymaps({ buffer = bufnr, exclude = { "gd", "<F2>", "<F3>", "<F4>", "gl", "[d", "]d" } })
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
