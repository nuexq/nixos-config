local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

local function border(hl_name)
	return {
		{ "┌", hl_name },
		{ "─", hl_name },
		{ "┐", hl_name },
		{ "│", hl_name },
		{ "┘", hl_name },
		{ "─", hl_name },
		{ "└", hl_name },
		{ "│", hl_name },
	}
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = {
			border = border("FloatBorder"),
			winhighlight = "Normal:Normal,CursorLine:Visual,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
		documentation = {
			border = border("FloatBorder"),
			winhighlight = "Normal:Normal,CursorLine:Visual,Search:None",
		},
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
	}),
	completion = { completeopt = "menu,menuone,noinsert" },
	sources = cmp.config.sources({
		{
			name = "lazydev",
			-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
			group_index = 0,
		},
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
})
