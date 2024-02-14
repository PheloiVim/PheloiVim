local function getFmt()
  local biome = vim.fs.find({ "biome.json" }, { upward = true, stop = vim.loop.os_homedir() })[1]
  local prettier = vim.fs.find(
    { ".prettierignore", ".prettierrc" },
    { upward = true, stop = vim.loop.os_homedir() }
  )[1]
  local deno =
    vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true, stop = vim.loop.os_homedir() })[1]

  if biome then
    return { "biome" }
  elseif prettier then
    return { "prettier" }
  elseif deno then
    return { "deno_fmt" }
  else
    return { { "biome", "prettier" } }
  end
end

return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  keys = {
    { "<leader>cf", function() require("conform").format() end, desc = "Format" },
  },
  opts = {
    format = {
      timeout_ms = 3000,
      async = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      sh = { "shfmt" },
      cs = { "clang_format" },
      go = { "goimports", "gofumpt" },
      rust = { "rustfmt" },
      json = getFmt(),
      jsonc = getFmt(),
      javascript = getFmt(),
      javascriptreact = getFmt(),
      typescript = getFmt(),
      typescriptreact = getFmt(),
      markdown = { "prettier" },
      vue = { "prettier" },
      yaml = { "prettier" },
      astro = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      graphql = { "prettier" },
      sql = { "sqlfluff" },
    },
  },
}
