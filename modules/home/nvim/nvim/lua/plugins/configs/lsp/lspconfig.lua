local catppuccin = require("catppuccin.palettes").get_palette()

local capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)

-- Folding configuration for nvim-ufo
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.cmd("highlight Folded guibg=" .. catppuccin.surface0)

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- LSP setup
local on_attach = require("cmp_nvim_lsp").on_attach
local mason_lspconfig = require("mason-lspconfig")
local servers = mason_lspconfig.get_installed_servers()

-- Manual server config for nixd
vim.lsp.config.nixd = {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_dir = require("lspconfig.util").root_pattern("flake.nix", "shell.nix", ".git"),
	on_attach = on_attach,
	capabilities = capabilities,
}

-- Enable all servers dynamically, except rust_analyzer
for _, server in ipairs(servers) do
	if server ~= "rust_analyzer" then
		vim.lsp.config[server] = {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		vim.lsp.enable(server)
	end
end

-- Enable nixd manually
vim.lsp.enable("nixd")

-- UFO setup
require("ufo").setup({
	fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
		local newVirtText = {}
		local suffix = (" 󰁂 %d "):format(endLnum - lnum)
		local sufWidth = vim.fn.strdisplaywidth(suffix)
		local targetWidth = width - sufWidth
		local curWidth = 0
		for _, chunk in ipairs(virtText) do
			local chunkText, hlGroup = chunk[1], chunk[2]
			local chunkWidth = vim.fn.strdisplaywidth(chunkText)
			if targetWidth > curWidth + chunkWidth then
				table.insert(newVirtText, chunk)
				curWidth = curWidth + chunkWidth
			else
				chunkText = truncate(chunkText, targetWidth - curWidth)
				table.insert(newVirtText, { chunkText, hlGroup })
				break
			end
		end
		table.insert(newVirtText, { suffix, "MoreMsg" })
		return newVirtText
	end,
})

-- Optional keymaps
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
