return {
	{
		'ellisonleao/gruvbox.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},

	-- { -- LSP Configuration & Plugins
	-- 	'neovim/nvim-lspconfig',
	-- 	dependencies = {
	-- 		-- Automatically install LSPs to stdpath for neovim
	-- 		'mfussenegger/nvim-dap',
	-- 		'jay-babu/mason-nvim-dap.nvim',
	-- 		{ 'rcarriga/nvim-dap-ui', config = true },
	--
	-- 	},
	-- },

	{ 
		'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
		config = true,
		keys = { { "gc" }, { "gc", mode = "v" } },
	},

	'airblade/vim-rooter',

	-- Easier tmux navigation (port of christoomey/vim-tmux-navigator)
	{ 'connordeckers/tmux-navigator.nvim', 
		lazy = false,
		config = { 
			enable = true
		}
	},

	-- autoclose and autorename html tags
	{ 
		'windwp/nvim-ts-autotag',
		config = true,
		ft = { "html" },
	},

	{ 
		'github/copilot.vim',
		cmd = "Copilot",
	},
}
