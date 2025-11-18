local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.biome.with({
			args = {
				"check",
				"--apply",
				"--apply-unsafe",
				"--formatter-enabled=true",
				"--organize-imports-enabled=true",
				"--linter-enabled=true",
				"--stdin-file-path",
				"$FILENAME",
			},
		}),
		null_ls.builtins.formatting.cbfmt,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.prettier.with({ filetypes = { "astro", "markdown" } }),
		null_ls.builtins.formatting.nixfmt,
		null_ls.builtins.formatting.latexindent,
		null_ls.builtins.diagnostics.vale,
	},
})
