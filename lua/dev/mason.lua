return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  keys = {
    { "<leader>pm", "<cmd>Mason<cr>", desc = "Mason" },
  },
  opts = {
    ensure_installed = {
      "shellcheck",
      "hadolint",
      "shfmt",
      "stylua",
      "clang-format",
      "golangci-lint",
      "goimports",
      "gofumpt",
      "nix",
      "gomodifytags",
      "impl",
      "sqlfluff",
      "prettier",
    },
    ui = {
      icons = {
        package_installed = "✓",
        package_uninstalled = "✗",
        package_pending = "⟳",
      },
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)

    local function install_package(package_name)
      local registry = require("mason-registry")
      local Optional = require("mason-core.optional")
      local p = require("mason-core.package")
      local source = p.Parse(package_name)

      Optional.of_nilable(source)
        :map(function(source_name)
          local ok, pkg = pcall(registry.get_package, source_name)
          if ok then return pkg end
        end)
        :if_present(function(pkg)
          if not pkg:is_installed() then
            vim.notify(("[pheloivim-mason] installing %s"):format(pkg.name), vim.log.levels.INFO)
            pkg:install():once("closed", function() vim.notify(("[pheloivim-mason] %s was installed"):format(pkg.name), vim.log.levels.INFO) end)
          end
        end)
    end

    for _, tool in ipairs(opts.ensure_installed) do
      install_package(tool)
    end
  end,
}
