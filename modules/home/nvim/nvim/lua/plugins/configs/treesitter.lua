local config = require("nvim-treesitter.configs")
config.setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = { enable = true },
})

vim.filetype.add({
	extension = { mdx = "mdx" },
})
vim.treesitter.language.register("markdown", "mdx")
