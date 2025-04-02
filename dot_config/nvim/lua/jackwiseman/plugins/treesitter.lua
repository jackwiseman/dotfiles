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
				'hcl',
				'lua',
				'markdown',
				'markdown_inline',
				'python',
				'regex',
				'rust',
				'starlark',
				'terraform',
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
