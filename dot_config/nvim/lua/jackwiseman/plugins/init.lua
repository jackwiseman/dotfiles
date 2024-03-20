return {
	{
		'ellisonleao/gruvbox.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},


	-- 		'mfussenegger/nvim-dap',
	-- 		'jay-babu/mason-nvim-dap.nvim',
	-- 		{ 'rcarriga/nvim-dap-ui', config = true },

	 -- "gc" to comment visual regions/lines
	{ 
		'numToStr/Comment.nvim',
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
	}
}
