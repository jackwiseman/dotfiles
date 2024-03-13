return {
	'tpope/vim-fugitive',
	{ 
		'tpope/vim-rhubarb',
		cmd = "GBrowse",
	},
	{ 
		'lewis6991/gitsigns.nvim',
		config = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		}
	}
}
