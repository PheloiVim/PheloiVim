local function getFmt()
  local biome = vim.fs.find({ "biome.json" }, { upward = true, stop = vim.loop.os_homedir() })[1]
  local prettier = vim.fs.find({ ".prettierignore", ".prettierrc" }, { upward = true, stop = vim.loop.os_homedir() })[1]
  local deno = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true, stop = vim.loop.os_homedir() })[1]

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
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        biome = {},
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "prettier" }) end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
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
      },
    },
  },
}
