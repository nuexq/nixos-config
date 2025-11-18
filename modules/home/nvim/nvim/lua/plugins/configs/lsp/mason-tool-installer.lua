require("mason-tool-installer").setup({
	ensure_installed = {
		"biome",
		"stylua",
		"cbfmt",
		"prettier",
    "nixfmt",
    "vale",
    "tex-fmt"
	},
	auto_update = false,
	run_on_start = true,
})
