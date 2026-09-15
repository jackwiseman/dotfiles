return {
	'mfussenegger/nvim-lint',
	-- events = { 'BufEnter, BufWritePost, InsertLeave' },
	ft = { 'sh' },
	config = function()
		local lint = require('lint')

		lint.linters_by_ft = {
			sh = { 'shellcheck' },
		}

		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
			group = vim.api.nvim_create_augroup('lint', { clear = true }),
			pattern = { '*.sh' },
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
