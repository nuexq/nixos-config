local ts = require("nvim-treesitter")

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match) or args.match
		if lang == "" or lang == "latex" then return end
		
		local ok = pcall(vim.treesitter.get_parser, 0, lang)
		if not ok then
			pcall(ts.install, lang)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match) or args.match

		if lang == "latex" then
			vim.bo.synmaxcol = 3000
			return
		end

		pcall(vim.treesitter.start)
		vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
	end,
})

vim.filetype.add({
	extension = { mdx = "mdx" },
})
vim.treesitter.language.register("markdown", "mdx")
