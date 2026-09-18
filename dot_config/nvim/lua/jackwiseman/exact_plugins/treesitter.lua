return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		local langs = {
			'astro',
			'bash',
			'c',
			'cpp',
			'go',
			'hcl',
			'just',
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
		}

		require('nvim-treesitter').install(langs)

		vim.api.nvim_create_autocmd('FileType', {
			callback = function(args)
				if not pcall(vim.treesitter.start, args.buf) then
					return
				end
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
