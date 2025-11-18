require("mason-lspconfig").setup({
	ensure_installed = {
		"eslint", -- eslint-lsp
		"vtsls", -- typescript-language-server
		"html", -- html-lsp
		"cssls", -- css-lsp
		"lua_ls", -- lua-language-server
		"clangd", -- clangd
		"bashls", -- Bash LSP
		"jsonls", -- JSON LSP
		"marksman", -- Markdown LSP
		"astro", -- Astro LSP
		"tailwindcss", -- Tailwind CSS Language Server
		"texlab", -- latex LSP
	},
})
