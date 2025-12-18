return {
	"alirezanobakht13/just-runner.nvim",
	dependencies = "folke/snacks.nvim",
	config = function()
		require("just-runner").setup({
			picker = "snacks",
			window_position = "bottom",
			close_on_success = false,
			close_on_error = false,
			pause_before_close = 200000,
		})
	end,
	keys = {
		{
			-- Open target selection
			"\\\\", function() require("just-runner").run() end,
		}
	}
}
