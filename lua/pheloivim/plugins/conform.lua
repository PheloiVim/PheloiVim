return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        local go_nvim_ok, gonvim = pcall(require, "go.format")
        local filetype = vim.bo.filetype
        if filetype == "go" and go_nvim_ok then
          gonvim.goimport()
        else
          require("conform").format()
        end
      end,
      desc = "Format",
    },
  },
  opts = {
    format = {
      timeout_ms = 3000,
      async = true,
    },
    formatters_by_ft = {},
  },
}
