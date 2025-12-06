return {
	-- Fuzzy Finder (files, lsp, etc)
	{ 
		'nvim-telescope/telescope.nvim',
		version = '0.2.0',
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
			{ "<leader>sa", "<cmd>Telescope<CR>", desc = "[S]earch [A]ll telescope utils"},
			{ "<leader>so", "<cmd>Telescope oldfiles<CR>", desc = "[S]earch [O]ld files"},
			{ "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "[S]earch Files" },
			{ "<leader>sw", "<cmd>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
			{ "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "[S]earch via [G]rep" },
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "[S]earch [B]uffer" },
			{ "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
			{ "<leader>sm", "<cmd>Telescope marks<CR>", desc = "[S]earch [D]iagnostics" },
			{ "<leader>sc", "<cmd>Telescope command_history<CR>", desc = "[S]earch recent [C]ommands" },
		}
	},
}
