return {
	"mhartington/formatter.nvim",
	lazy = true,
	event = {
		"BufWritePre",
	},
	config = function()
		require("formatter").setup({
			filetype = {
				go = {
					require("formatter.filetypes.go").gofmt,
					require("formatter.filetypes.go").goimports,
				},
			},
		})

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end,
}
