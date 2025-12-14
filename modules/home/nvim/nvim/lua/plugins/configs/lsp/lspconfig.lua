local capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)

-- Folding configuration for nvim-ufo
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- LSP setup
local on_attach = require("cmp_nvim_lsp").on_attach
local mason_lspconfig = require("mason-lspconfig")

vim.lsp.config("*", {
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Typescript/Javascript (vtsls)
vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
		javascript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
	},
})

-- Lua Language Server
vim.lsp.config.lua_ls = {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			completion = { callSnippet = "Replace" },
			telemetry = { enable = false },
			diagnostics = { disable = { "missing-fields" } },
		},
	},
}

local servers = mason_lspconfig.get_installed_servers()

for _, server in ipairs(servers) do
	if server ~= "rust_analyzer" then
		vim.lsp.enable(server)
	end
end

-- Manual setup
vim.lsp.enable("nil_ls")
