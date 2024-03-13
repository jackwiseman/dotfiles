return {
	'nvim-treesitter/nvim-treesitter',
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	opts = "nvim-treesitter.configs",
	config = {
		-- Add languages to be installed here that you want installed for treesitter
		ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'vim', 'astro' },

		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
		},
	}
}
