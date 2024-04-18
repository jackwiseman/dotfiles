return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		'nvim-telescope/telescope.nvim',
		'kkharji/sqlite.lua'
	},
	keys = {
		{ '<leader>y', "<cmd>Telescope neoclip<cr>", desc = "Search yanks" },
	},
	opts = {
		default_register = '+',
		enable_persistent_history = true,
		keys = {
			telescope = {
				i = {
					paste = '<nop>',
					paste_behind = '<nop>'
				}
			}
		}
	},
}
