return {
	'https://github.com/github/copilot.vim',
	lazy = false,
	init = function()
		vim.g.copilot_no_tab_map = true
	end,
	config = function()
		vim.keymap.set('i', '<C-V>', '<Plug>(copilot-accept-line)')
	end

}
