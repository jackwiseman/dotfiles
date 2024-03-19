return {
	{
		'ellisonleao/gruvbox.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},

	{
		"mhartington/formatter.nvim",
		lazy = true,
		event = {
			"BufWritePre",
		},
		config = function()
			require("formatter").setup({
				filetype = {
					go = {
						require("formatter.filetypes.go").gofmt,
						require("formatter.filetypes.go").goimports,
					},
				},
			})

			local augroup = vim.api.nvim_create_augroup
			local autocmd = vim.api.nvim_create_autocmd
			augroup("__formatter__", { clear = true })
			autocmd("BufWritePost", {
				group = "__formatter__",
				command = ":FormatWrite",
			})
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
	}
}
