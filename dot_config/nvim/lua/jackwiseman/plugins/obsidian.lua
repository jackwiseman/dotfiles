return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = {
	  "BufReadPre " .. vim.fn.expand "~" .. "obsidian/**.md",
	  "BufNewFile " .. vim.fn.expand "~" .. "obsidian/**.md",
	},
	keys = {
		{ "<leader>on", ":ObsidianNew<CR>", silent = true, desc = "create a new obsidian note" },
		{ "<leader>of", ":ObsidianFollowLink<CR>", silent = true, desc = "follow obsidian backlink" },
		{ "<leader>og", ":ObsidianSearch<CR>", silent = true, desc = "search obsidian vault (grep)" },
		{ "<leader>os", ":ObsidianQuickSwitch<CR>", silent = true, desc = "search obsidian vault files" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		'hrsh7th/nvim-cmp',
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/obsidian",
			},
		},
		ui = {
			enable = false,
		},
		disable_frontmatter = true,
	},
}
