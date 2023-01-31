local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local servers = { "sumneko_lua", "html", "cssls", "tsserver", "rome", "clangd", "rust_analyzer" }

mason.setup({
	ui = {
		border = "solid",
		icons = {
			package_installed = " ",
			package_pending = " ",
			package_uninstalled = " ",
		},
	},
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
