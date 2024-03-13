return {
	{ -- Color
		'ellisonleao/gruvbox.nvim', -- Port of the classic gruvbox theme
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},


	{ -- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'mfussenegger/nvim-dap',
			'jay-babu/mason-nvim-dap.nvim',
			'rcarriga/nvim-dap-ui',

			-- Additional lua configuration, makes nvim stuff amazing
			'folke/neodev.nvim',
		},
	},

	{ -- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	},

	{ 
		'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
		config = true
	},

	'airblade/vim-rooter',

	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

	-- Easier tmux navigation (port of christoomey/vim-tmux-navigator)
	{ 'connordeckers/tmux-navigator.nvim', 
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
