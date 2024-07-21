return {
	'https://github.com/github/copilot.vim',
	lazy = false,
	config = function()
		vim.keymap.set('i', '<C-m>', '<Plug>(copilot-accept-line)')
	end
}
