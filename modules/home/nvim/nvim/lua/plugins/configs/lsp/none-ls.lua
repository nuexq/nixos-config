local null_ls = require("null-ls")

local tex_fmt = null_ls.register({
	name = "tex_fmt",
	method = null_ls.methods.FORMATTING,
	filetypes = { "tex" },
	generator = null_ls.formatter({
		command = "tex-fmt",
		args = { "--stdin", "--print" },
		to_stdin = true,

		on_output = function(params)
			return params.output
		end,
	}),
})

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
		tex_fmt,
		null_ls.builtins.diagnostics.vale,
	},
})
