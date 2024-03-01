return {
  "stevearc/dressing.nvim",
  init = function()
    for _, func in pairs({ "input", "select" }) do
      vim.ui[func] = function() require("lazy").load({ plugins = { "dressing.nvim" } }) end
    end
  end,
  opts = {
    input = { default_prompt = "➤ " },
    select = { backend = { "telescope", "builtin" } },
  },
}
