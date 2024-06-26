return {
	'mfussenegger/nvim-lint',
	-- events = { 'BufEnter, BufWritePost, InsertLeave' },
	lazy = false,
	config = function()
		local lint = require('lint')
		local eslint = lint.linters.eslint_d

		lint.linters_by_ft = {
			sh = { 'shellcheck' },
			javascript = { 'eslint_d' },
		}

		-- for defaults in single file mode
		eslint.args = {
			'--no-eslintrc',
			'--config',
			vim.fn.expand('$HOME/.eslintrc.js'),
			'--format',
			'json',
			'--stdin',
			'--stdin-filename',
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
			group = vim.api.nvim_create_augroup('lint', { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
