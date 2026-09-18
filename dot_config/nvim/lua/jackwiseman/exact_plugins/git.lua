return {
	{
		'tpope/vim-fugitive',
		keys = {
			{ "<leader>gs", "<cmd>G<cr>", desc = "Git status" },
		}
	},
	{ 
		'tpope/vim-rhubarb',
		cmd = "GBrowse",
	},
	{ 
		'lewis6991/gitsigns.nvim',
		event = "BufReadPost",
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		}
	},
	{
		'f-person/git-blame.nvim',
		keys = {	
			{ "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Git blame" },
		}
	}
}
