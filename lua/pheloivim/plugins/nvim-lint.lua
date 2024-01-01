return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile", "BufWritePost" },
  opts = {
    linters_by_ft = {
      go = { "golangcilint" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = opts.linters_by_ft
    local linters = {}

    for _, list_linters in pairs(opts.linters_by_ft) do
      for _, linter in ipairs(list_linters) do
        table.insert(linters, linter)
      end
    end

    for _, linter in pairs(linters) do
      require("pheloivim.utils").install_package(linter)
    end

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function() lint.try_lint() end,
    })
  end,
}
