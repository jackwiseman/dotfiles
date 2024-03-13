return {
	'kyazdani42/nvim-tree.lua',
	keys = {
		{ "<leader>f", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
	},
	config = {
		view = {
			relativenumber = true,
		},
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
	},
	dependencies = { 'kyazdani42/nvim-web-devicons' },
}
