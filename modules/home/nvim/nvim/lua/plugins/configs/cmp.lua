local cmp = require("cmp")
local luasnip = require("luasnip")

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
			luasnip.lsp_expand(args.body)
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
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true }) -- confirm completion if menu open
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump() -- jump in snippet
			else
				fallback() -- normal tab
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1) -- jump backward in snippet
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
	}),
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	sources = cmp.config.sources({
		{ name = "lazydev", group_index = 0 },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
})
