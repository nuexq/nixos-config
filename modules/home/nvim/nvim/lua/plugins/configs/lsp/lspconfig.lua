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
-- nix LSP
local flake = vim.env.NH_FLAKE or (vim.fn.expand("~") .. "/nixos-config")

vim.lsp.config.nixd = {
	cmd = { "nixd" },
	filetypes = { "nix" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = 'import (builtins.getFlake "' .. flake .. '").inputs.nixpkgs { }',
			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "' .. flake .. '").nixosConfigurations.NoPC.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "' .. flake .. '").nixosConfigurations.NoPC.options.home-manager',
				},
			},
		},
	},
}
vim.lsp.enable("nixd")

-- QML LSP
local system_qml_path = "/run/current-system/sw/lib/qt-6/qml"
local home_manager_qml_path = vim.fn.expand("~/.local/state/nix/profiles/home-manager/home-path/lib/qt-6/qml")
local user_qml_path = vim.fn.expand("~/.nix-profile/lib/qt-6/qml")

local import_paths = table.concat({
	system_qml_path,
	user_qml_path,
	home_manager_qml_path,
}, ":")

vim.lsp.config.qmlls = {
	cmd = { "qmlls" },
	cmd_env = {
		QML2_IMPORT_PATH = import_paths,
		QML_IMPORT_PATH = import_paths,
	},
	filetypes = { "qml", "qmljs" },
	root_markers = { "qmldir", "CMakeLists.txt", "qmlls.ini", ".git" },
}
vim.lsp.enable("qmlls")

-- Typst LSP
vim.lsp.config.tinymist = {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	root_markers = { "main.typ", ".git" },
	settings = {
		rootPath = "/home/nuexq/Documents/notes/",
		formatterMode = "disable",
		exportPdf = "onType",
		outputPath = "$dir/$name",
		semanticTokens = "disable",
	},
}
vim.lsp.enable("tinymist")

vim.api.nvim_create_user_command("TypstOpen", function()
	local pdf = vim.fn.expand("%:p:r") .. ".pdf"
	if vim.fn.filereadable(pdf) == 0 then
		vim.notify("No PDF yet: " .. pdf, vim.log.levels.WARN)
		return
	end
	vim.system({ "zathura", pdf }, { detach = true })
end, {})

vim.api.nvim_create_user_command("TypstExportMode", function(opts)
	local client = vim.lsp.get_clients({ name = "tinymist" })[1]
	if not client then
		vim.notify("tinymist is not running", vim.log.levels.WARN)
		return
	end
	local settings = client.settings or client.config.settings
	local mode = opts.args
	if mode == "" then
		mode = (settings.exportPdf == "onType") and "onSave" or "onType"
	end
	settings.exportPdf = mode
	client.settings = settings
	client.config.settings = settings
	client:notify("workspace/didChangeConfiguration", { settings = settings })
	vim.notify("Typst PDF export: " .. mode)
end, {
	nargs = "?",
	complete = function()
		return { "onType", "onSave", "never" }
	end,
})
