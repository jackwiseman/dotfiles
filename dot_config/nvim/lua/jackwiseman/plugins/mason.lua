return {
	'williamboman/mason.nvim',
	event = "BufReadPost",
	dependencies = { 'williamboman/mason-lspconfig.nvim' },

	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')

		mason.setup({})

		mason_lspconfig.setup({
			ensure_installed = {
				"gopls"
			},
			-- :h mason-lspconfig-automatic-server-setup
			automatic_installation = true
		})
	end
}
