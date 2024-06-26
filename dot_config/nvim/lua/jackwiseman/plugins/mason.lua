return {
	'williamboman/mason.nvim',
	event = "BufReadPost",
	cmd = "Mason",
	dependencies = { 
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},

	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')
		local mason_tool_installer = require('mason-tool-installer')

		mason.setup({})

		mason_lspconfig.setup({
			ensure_installed = {
				'gopls',
				'tsserver'
			},
			automatic_installation = true
		})

		mason_tool_installer.setup({
			ensure_installed = {
				'goimports',
				'shellcheck', -- linting for shell scripts
				'eslint_d'
			},
			run_on_start = true,
		})
	end,
}
