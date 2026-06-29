return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "Avante" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		heading = {
			icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
			sign = false,
		},
		code = {
			sign = false,
			width = "block",
			right_pad = 2,
		},
		checkbox = {
			enabled = true,
		},
		pipe_table = {
			enabled = true,
			style = "full",
		},
	},
}
