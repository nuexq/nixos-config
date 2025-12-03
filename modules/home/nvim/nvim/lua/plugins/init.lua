return {
	-- Appearance
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("plugins.configs.ui.colorscheme")
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine", opts = {}, event = "VeryLazy" },
	{ "kepano/flexoki-neovim", name = "flexoki" },
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("plugins.configs.ui.alpha")
		end,
	},
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("tiny-devicons-auto-colors").setup({})
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		opts = {},
	},

	-- UI Enhancements
	{
		"xiyaowong/virtcolumn.nvim",
		event = "VeryLazy",
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.configs.ui.bufferline")
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.configs.ui.lualine")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "classic",
				options = {
					use_icons_from_diagnostic = true,
					multiple_diag_under_cursor = true,
					show_all_diags_on_cursorline = true,
					enable_on_insert = true,
					multilines = {
						enabled = true,
						always_show = true,
					},
					virt_texts = {
						priority = 2048,
					},
				},
			})
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		end,
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		opts = {},
		cmd = "Trouble",
	},
	{ "HiPhish/rainbow-delimiters.nvim", event = "BufReadPost" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("plugins.configs.ui.noice")
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		event = "VeryLazy",
		config = function()
			local catppuccin = require("catppuccin.palettes").get_palette()

			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.cmd("highlight Folded guibg=" .. catppuccin.surface0)

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
		end,
	},

	-- Utility
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
	},
	{
		"nullishamy/autosave.nvim",
		event = "VeryLazy",
		config = function()
			require("autosave").setup({})
		end,
	},
	-- Editing Helper
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = { delay = 1000, preset = "modern", win = { border = "single" } },
	},
	{
		"willothy/moveline.nvim",
		event = "VeryLazy",
		build = "make",
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup({
				toggler = { line = "<leader>/" },
				opleader = { line = "<leader>/" },
				mappings = { extra = false, basic = true },
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
		opts = {
			per_filetype = {
				["astro"] = {
					enable = true,
				},
			},
		},
	},
	{
		"Wansmer/treesj",
		keys = {
			{ "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
		},
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		opts = { use_default_keymaps = false },
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({ keymaps = { visual = "s" } }) -- NOTE: Keymaps here
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = true,
		event = "InsertEnter",
	},
	{
		"famiu/bufdelete.nvim",
		event = "VeryLazy",
	},

	-- Navigation and Search
	{
		"MagicDuck/grug-far.nvim",
		event = "VeryLazy",
		config = function()
			require("grug-far").setup({})
		end,
	},
	{
		"echasnovski/mini.files",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.files").setup({
				options = {
					use_as_default_explorer = false,
				},
				windows = {
					preview = true,
					width_focus = 45,
					width_nofocus = 30,
					width_preview = 45,
				},
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeCollapse" },
		config = function()
			require("plugins.configs.ui.nvim-tree")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		opts = { open_mapping = [[<M-o>]] },
	},
	{
		"natecraddock/workspaces.nvim",
		event = "VeryLazy",
		config = function()
			require("workspaces").setup({ hooks = { open = { "Telescope find_files" } } })
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("plugins.configs.telescope")
		end,
	},
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{
		"dmtrKovalenko/fff.nvim",
		build = "nix run .#release",
		opts = {
			keymaps = {
				move_up = { "<Up>", "<C-k>" },
				move_down = { "<Down>", "<C-j>" },
			},
			debug = {
				enabled = false,
				show_scores = false,
			},
		},
		lazy = false,
	},

	-- Git Integration
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		config = function()
			require("diffview").setup({
				file_panel = {
					listing_style = "list",
					win_config = {
						position = "right",
						width = 30,
						win_opts = {},
					},
				},
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
	},
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
	},

	-- Miscellaneous
	{ "danilamihailov/beacon.nvim" },
	{
		"rachartier/tiny-glimmer.nvim",
		event = "LspAttach",
		opts = {
			animations = {
				fade = {
					from_color = "DiffDelete",
					to_color = "DiffAdd",
				},
			},
		},
	},
	{
		"declancm/cinnamon.nvim",
		version = "*", -- use latest release
		event = "VeryLazy",
		opts = {
			keymaps = {
				basic = true,
			},
			delay = 1,
			max_delta = {
				column = 1,
				time = 300,
			},
		},
	},
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		event = "VeryLazy",
		opts = {
			display = {
				theme = "default",
				flavor = "accent",
			},
		},
	},
	{
		"nacro90/numb.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "mdx" },
			heading = {
				width = "block",
				left_pad = 1,
				right_pad = 2,
				position = "inline",
			},
			code = {
				width = "block",
				left_pad = 2,
				right_pad = 2,
			},
		},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{
		"szw/vim-maximizer",
		event = "VeryLazy",
		keys = {
			{ "<leader>sm", "<CMD>MaximizerToggle<CR>", desc = "Toggle Maximizer" },
		},
	},

	-- Syntax and Language Support
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},

	-- LSP
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("plugins.configs.lsp.mason-tool-installer")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugins.configs.lsp.mason-lspconfig")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp.lspconfig")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},

		config = function()
			require("plugins.configs.lsp.none-ls")
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
		ft = "rust",
		["rust-analaysis"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "tectonic"
		end,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
		},

		config = function()
			require("plugins.configs.cmp")
		end,
	},
	-- Misc
	{
		"kawre/leetcode.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lang = "typescript",
			image_support = true,
		},
	},
}
