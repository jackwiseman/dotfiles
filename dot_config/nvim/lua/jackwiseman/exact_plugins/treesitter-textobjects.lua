return {
	'nvim-treesitter/nvim-treesitter-textobjects',
	branch = 'main',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require('nvim-treesitter-textobjects').setup({
			select = {
				lookahead = true,
			},
			move = {
				set_jumps = true,
			},
		})

		local select = require('nvim-treesitter-textobjects.select')
		local move = require('nvim-treesitter-textobjects.move')
		local swap = require('nvim-treesitter-textobjects.swap')

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
		end

		map({ 'x', 'o' }, 'aa', function() select.select_textobject('@parameter.outer', 'textobjects') end, 'a parameter')
		map({ 'x', 'o' }, 'ia', function() select.select_textobject('@parameter.inner', 'textobjects') end, 'inner parameter')
		map({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end, 'a function')
		map({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end, 'inner function')
		map({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', 'textobjects') end, 'a class')
		map({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', 'textobjects') end, 'inner class')

		map({ 'n', 'x', 'o' }, ']m', function() move.goto_next_start('@function.outer', 'textobjects') end, 'next function start')
		map({ 'n', 'x', 'o' }, ']]', function() move.goto_next_start('@class.outer', 'textobjects') end, 'next class start')
		map({ 'n', 'x', 'o' }, ']M', function() move.goto_next_end('@function.outer', 'textobjects') end, 'next function end')
		map({ 'n', 'x', 'o' }, '][', function() move.goto_next_end('@class.outer', 'textobjects') end, 'next class end')
		map({ 'n', 'x', 'o' }, '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end, 'prev function start')
		map({ 'n', 'x', 'o' }, '[[', function() move.goto_previous_start('@class.outer', 'textobjects') end, 'prev class start')
		map({ 'n', 'x', 'o' }, '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end, 'prev function end')
		map({ 'n', 'x', 'o' }, '[]', function() move.goto_previous_end('@class.outer', 'textobjects') end, 'prev class end')

		map('n', '<leader>a', function() swap.swap_next('@parameter.inner') end, 'swap parameter next')
		map('n', '<leader>A', function() swap.swap_previous('@parameter.inner') end, 'swap parameter prev')
	end,
}
