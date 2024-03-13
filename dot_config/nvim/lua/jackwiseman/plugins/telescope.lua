return {
	-- Fuzzy Finder (files, lsp, etc)
	{ 
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x', 
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function(self, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end,
		keys = function(self, opts)
			local builtin = require('telescope.builtin')
			return {
				{ "<leader>sf", builtin.find_files, desc = '[S]earch [F]iles' },
				{ "<leader>sf", builtin.help_tags, desc = '[S]earch [H]help' },
				{ "<leader>sw", builtin.grep_string, desc = '[S]earch current [W]ord' },
				{ "<leader>sg", builtin.live_grep, desc = '[S]earch by [G]rep' },
				{ "<leader>sd", builtin.diagnostics, desc = '[S]earch [D]iagnostics' }
			}
		end
	},
			
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
}
