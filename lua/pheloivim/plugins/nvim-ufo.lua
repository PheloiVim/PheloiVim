return {
  "kevinhwang91/nvim-ufo",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = "kevinhwang91/promise-async",
  keys = {
    { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
    { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
  },
  init = function()
    vim.o.foldcolumn = "0"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldnestmax = 0
    vim.o.foldenable = true
  end,
  opts = {
    provider_selector = function() return { "treesitter", "indent" } end,
  },
  config = function(_, opts)
    require("ufo").setup(opts)
    require("lsp-zero").set_server_config({
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
    })
  end,
}
