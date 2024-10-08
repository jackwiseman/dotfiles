return {
	'nvim-treesitter/nvim-treesitter',
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'nvim-treesitter/nvim-treesitter-context',
	},
	config = function()
		local configs = require('nvim-treesitter.configs')
		configs.setup({
			ensure_installed = {
				'astro',
				'bash',
				'c',
				'cpp',
				'go',
				'lua',
				'markdown',
				'markdown_inline'
				'python',
				'regex',
				'rust',
				'starlark',
				'typescript',
				'vim',
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
			},
		})
	end
}
