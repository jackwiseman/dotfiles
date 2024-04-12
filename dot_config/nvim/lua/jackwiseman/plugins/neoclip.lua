return {
	"AckslD/nvim-neoclip.lua",
	dependencies = { 'nvim-telescope/telescope.nvim' },
	keys = {
		{ '<leader>y', "<cmd>Telescope neoclip<cr>", desc = "Search yanks" },
	},
	opts = {
		default_register = '+',
	},
}
