local servers = { "sumneko_lua", "rust_analyzer", "clangd", "pyright", "html", "tailwindcss" }

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- Mason options
local options = {
	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ﮊ",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},
	max_concurrent_installers = 10,
}

-- LSP toggle
local opts = {}
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end
for _, server in pairs(servers) do
	opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}
	server = vim.split(server, "@")[1]
	lspconfig[server].setup(opts)
end

-- Mason options
require("mason").setup(options)
