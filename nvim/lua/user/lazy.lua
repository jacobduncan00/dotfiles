-- Lazy install bootstrap snippet
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

lazy.setup({

	-- Install the catppuccin theme
	{ "catppuccin/nvim" },

	-- Install treesitter for better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		dependencies = {
			-- Additional text objects for treesitter
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	-- Install nvim-notify for better notifications
	"rcarriga/nvim-notify",

	-- Install LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Plugin and UI to automatically install LSPs to stdpath
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Install null-ls for diagnostics, code actions, and formatting
			"jose-elias-alvarez/null-ls.nvim",

			-- Install neodev for better nvim configuration and plugin authoring via lsp configurations
			"folke/neodev.nvim",

			-- Progress/Status update for LSP
			{ "j-hui/fidget.nvim", tag = "legacy" },
		},
	},

	-- Install Autocomplete dependencies
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
	},

	-- Install telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Install fuzzy finder for telescope
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = vim.fn.executable("make") == 1,
	},

	-- Install nvim-lsp-file-operations for file operations via lsp in the file tree
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
	},

	-- Install neo-tree for a vscode-like file tree/explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
			},
		},
	},

	-- Install lualine for a better status line
	"nvim-lualine/lualine.nvim",

	-- Install gitsigns for git decorations/indicators
	"lewis6991/gitsigns.nvim",

	-- Install Comment to enable easy/quick (un)commenting
	"numToStr/Comment.nvim",

	-- Install indent_blankline to style indentation
	"lukas-reineke/indent-blankline.nvim",

	-- Install nvim-autopairs  and nvim-ts-autotag to auto close brackets & tags
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- Install vim-surround for managing parenthese, brackets, quotes, etc
	"tpope/vim-surround",

	-- Install maximizer as a depedency to easily toggle max/min a split buffer
	"szw/vim-maximizer",

	-- Install dressing to create better ui/pop ups for vim.ui.input and vim.ui.select elements
	"stevearc/dressing.nvim",

	-- Install harpoon easy tracking/switching of multiple buffers
	"ThePrimeagen/harpoon",

	-- Install wilder to improve the wildmenu
	"gelguy/wilder.nvim",

	-- Install symbol-outine for a sidebar toggle for the current buffers symbols
	"simrat39/symbols-outline.nvim",

	-- Install context-commentstring to enable jsx commenting is ts/js/tsx/jsx files
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- Install Github Copilot
	-- "github/copilot.vim",
	"zbirenbaum/copilot.lua",

	-- Install tsc.nvim to enable project-wide type checking and diagnostics
	-- use({ "dmmulroy/tsc.nvim" })
	"dmmulroy/tsc.nvim",

	-- Install vim-kitty-navigator to enable better navigation between neovim and kitty
	-- "knubie/vim-kitty-navigator",
	"dmmulroy/vim-kitty-navigator",

	-- Install nvim-spectre for global find/replace
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- "stevearc/oil.nvim",

	--Install nvim-ufo for better folds
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
})
