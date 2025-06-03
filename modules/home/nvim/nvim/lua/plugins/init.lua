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
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({})
		end,
	},
	{
		"goolord/alpha-nvim",
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

	-- UI Enhancements
	{
		"akinsho/bufferline.nvim",
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
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.configs.ui.lualine")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = "BufEnter",
		config = function()
			require("plugins.configs.ui.nvim-tree")
		end,
	},
	{
		"echasnovski/mini.files",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.files").setup({
				options = {
					use_as_default_explorer = true,
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
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>-",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		opts = {},
		cmd = "Trouble",
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
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
	{ "HiPhish/rainbow-delimiters.nvim", event = "VeryLazy" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("plugins.configs.ui.noice")
		end,
	},

	-- Utility
	{
		"nullishamy/autosave.nvim",
		event = "VeryLazy",
		config = function()
			require("autosave").setup({})
		end,
	},
	{
		"willothy/moveline.nvim",
		event = "VeryLazy",
		build = "make",
	},

	-- Editing Helper
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = { "nvimtools/hydra.nvim" },
		opts = {},
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
			{
				"<leader>m",
				"<CMD>TSJToggle<CR>",
				desc = "Toggle Treesitter Join",
			},
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

	-- Navigation and Search
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
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

	-- Git Integration
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
		event = "TextYankPost",
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
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	{
		"famiu/bufdelete.nvim",
		event = "VeryLazy",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		opts = {},
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
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = { delay = 1000, preset = "modern", win = { border = "single" } },
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
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			return require("plugins.configs.lsp.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	-- {
	-- 	"cordx56/rustowl",
	-- 	config = function()
	-- 		local lspconfig = require("lspconfig")
	-- 		lspconfig.rustowlsp.setup({
	-- 			idle_time = 1000,
	-- 		})
	-- 	end,
	-- },

	-- Completion
	{
		"supermaven-inc/supermaven-nvim",
		event = "VeryLazy",
		config = function()
			require("supermaven-nvim").setup({
				log_level = "off",
				keymaps = {
					accept_suggestion = "<M-n>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-j>",
				},
			})
		end,
	},

	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		opts = {}, -- your configuration
	},

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
}
