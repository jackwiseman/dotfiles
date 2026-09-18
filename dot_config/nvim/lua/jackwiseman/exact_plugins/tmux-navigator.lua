return {
	'connordeckers/tmux-navigator.nvim', 
	opts = {
		DisableMapping = true,
	},
	keys = {
		{ "<C-h>", "<cmd>lua require('tmux-navigator.controls').navigate.left()<CR>", silent = true, desc = "navigate left with tmux" },
		{ "<C-l>", "<cmd>lua require('tmux-navigator.controls').navigate.right()<CR>", silent = true, desc = "navigate right with tmux" },
		{ "<C-j>", "<cmd>lua require('tmux-navigator.controls').navigate.down()<CR>", silent = true, desc = "navigate up with tmux" },
		{ "<C-k>", "<cmd>lua require('tmux-navigator.controls').navigate.up()<CR>", silent = true, desc = "navigate down with tmux" },
	}
}
