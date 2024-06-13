-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme

return {

	-- indent line
	"lukas-reineke/indent-blankline.nvim",
	-- jinja
	"lepture/vim-jinja",
	-- autopair
	"cohama/lexima.vim",
	-- formatter
	"mhartington/formatter.nvim",
	-- surround
	"tpope/vim-surround",
	-- buffer management
	"jeetsukumaran/vim-buffergator",
	-- icons
	"nvim-tree/nvim-web-devicons",
	-- colorschemes
	"sainnhe/sonokai",
	-- comment
	{
		"numToStr/Comment.nvim",
		opts = {},
	},

	-- shortcuts
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},

	-- hardmode
	--  {
	--    "m4xshen/hardtime.nvim",
	--    opts = {}
	--  },

	-- autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
		},
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	-- git labels
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- motion
	{
		"ggandor/leap.nvim",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			multiline = false,
		},
	},
}
