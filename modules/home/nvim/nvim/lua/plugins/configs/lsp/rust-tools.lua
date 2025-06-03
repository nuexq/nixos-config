local on_attach = require("cmp_nvim_lsp").on_attach
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local options = {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
}

return options
