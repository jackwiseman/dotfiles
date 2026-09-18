return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'BufRead',
	keys = { "<leader>st", "TodoTelescope keywords=TODO" },
	opts = {}
}
