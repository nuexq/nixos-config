local ts = require("nvim-treesitter")

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match) or args.match

		if lang == "" or lang == "alpha" or lang == "latex" then
			if lang == "latex" then
				vim.bo.synmaxcol = 3000
			end
			return
		end

		local has_parser = pcall(vim.treesitter.get_parser, 0, lang)

		if not has_parser then
			pcall(ts.install, { lang })
		else
			pcall(vim.treesitter.start)
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

vim.filetype.add({
	extension = { mdx = "mdx" },
})
vim.treesitter.language.register("markdown", "mdx")
