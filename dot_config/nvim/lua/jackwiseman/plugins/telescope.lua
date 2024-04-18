return {
	-- Fuzzy Finder (files, lsp, etc)
	{ 
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x', 
		dependencies = { 
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
		},
		cmd = "Telescope",
		config = function(self, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end,
		keys = {
			{ "<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "[S]earch Files" },
			{ "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", desc = "[S]earch [H]elp" },
			{ "<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<CR>", desc = "[S]earch current [W]ord" },
			{ "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = "[S]earch via [G]rep" },
			{ "<leader>sb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", desc = "[S]earch [B]uffer" },
			{ "<leader>sd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", desc = "[S]earch [D]iagnostics" },
			{ "<leader>sm", "<cmd>lua require('telescope.builtin').marks()<CR>", desc = "[S]earch [D]iagnostics" },
			{ "<leader>sc", "<cmd>lua require('telescope.builtin').command_history()<CR>", desc = "[S]earch recent [C]ommands" },
		}
	},
}
