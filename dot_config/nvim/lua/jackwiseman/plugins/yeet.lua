return {
	'samharju/yeet.nvim',
	dependencies = {
		'stevearc/dressing.nvim'
	},
	cmd = 'Yeet',
	opts = {},
	keys = {
		{
			-- Open target selection
			"<leader>yt", function() require("yeet").select_target() end,
		},
		{
			-- Update yeeted command
			"<leader>yc", function() require("yeet").set_cmd() end,
		},
		{
			-- Douple tap \ to yeet at something
			"\\\\", function() require("yeet").execute() end,
		},
		{
			-- Toggle autocommand for yeeting after write.
			"<leader>yo", function() require("yeet").toggle_post_write() end,
		},
		{
			-- Run command without clearing terminal
			"<leader>\\", function()
				require("yeet").execute(nil, { clear_before_yeet = false})
			end,
		}
	},
}
