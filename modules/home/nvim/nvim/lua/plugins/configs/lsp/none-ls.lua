local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.biome.with({
			args = {
				"check",
				"--write",
				"--unsafe",
				"--formatter-enabled=true",
				"--organize-imports-enabled=true",
				"--skip-errors",
				"--stdin-file-path=$FILENAME",
			},
		}),
		null_ls.builtins.formatting.cbfmt,
		null_ls.builtins.formatting.clang_format.with({
			filetypes = { "c", "cpp", "cc", "cxx", "h", "hpp" },
		}),
		null_ls.builtins.formatting.prettier.with({
			filetypes = { "astro" },
		}),
		null_ls.builtins.diagnostics.eslint_d, -- Use the built-in diagnostics for eslint_d
		null_ls.builtins.diagnostics.biome,
		null_ls.builtins.formatting.eslint_d,
	},
})
