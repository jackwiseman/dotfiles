return {
	'williamboman/mason.nvim',
	event = "BufReadPost",
	dependencies = { 
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},

	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')
		local mason_tool_installer = require('mason-tool-installer')

		mason.setup({})

		mason_tool_installer.setup({
			ensure_installed = {
				'gopls',
				'tsserver',
				'goimports',
				'shellcheck', -- linting for shell scripts
			},
			run_on_start = true,
		})
	end,
}
