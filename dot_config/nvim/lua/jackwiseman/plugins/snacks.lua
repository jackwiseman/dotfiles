return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = { 
			enabled = true,
			layout = {
				reverse = true,
				layout = {
					box = "horizontal",
					backdrop = false,
					width = 0.8,
					height = 0.9,
					border = "none",
					{
						box = "vertical",
						{ win = "list", title = " Results ", title_pos = "center", border = true },
						{ win = "input", height = 1, border = true, title = "{title} {live} {flags}", title_pos = "center" },
					},
					{
						win = "preview",
						title = "{preview:Preview}",
						width = 0.45,
						border = true,
						title_pos = "center",
					},
				},
			},
		},
	},
	keys = {
		{ "<leader>sa", function() Snacks.picker() end, desc = "Search all picker utils" },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "[F]ind [F]iles" },
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch via [G]rep" },
		{ "<leader>fg", function() Snacks.picker.git_files({untracked=true}) end, desc = "[F]ind [G]it files" },
		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
		{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
		{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
	},
}
