local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("cmp_nvim_lsp").on_attach
local lspconfig = require("lspconfig")

-- Automatically set up all other servers installed via Mason, excluding rust_analyzer
local mason_lspconfig = require("mason-lspconfig")
local servers = mason_lspconfig.get_installed_servers()

for _, server in ipairs(servers) do
	if server ~= "rust_analyzer" then -- Exclude rust_analyzer
		lspconfig[server].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end
