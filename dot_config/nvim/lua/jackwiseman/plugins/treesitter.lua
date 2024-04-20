return {
	'nvim-treesitter/nvim-treesitter',
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	config = function()
		local configs = require('nvim-treesitter.configs')
		configs.setup({
			ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'vim', 'astro', 'regex', 'bash', 'markdown', 'markdown_inline' },

			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
			},
		})
	end
}
