return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = '[R]e[n]ame'
			keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

			opts.desc = '[C]ode [A]ction'
			keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

			opts.desc = '[G]oto [D]efinition'
			keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>', opts)

			opts.desc = '[G]oto [R]eferences'
			keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', opts)

			opts.desc = '[G]oto [I]mplementation'
			keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)

			opts.desc = 'Type [D]efinition'
			keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)

			opts.desc = '[D]ocument [S]ymbols'
			keymap.set('n', '<leader>ds', '<cmd>Telescope lsp_document_symbols<CR>', opts)

			opts.desc = '[W]orkspace [S]ymbols'
			keymap.set('n', '<leader>ws', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)

			opts.desc = 'Hover Documentation'
			keymap.set('n', 'K', vim.lsp.buf.hover, opts)

			-- opts.desc = 'Signature Documentation'
			-- keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

			-- Create a command `:Format` local to the LSP buffer
			vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
				vim.lsp.buf.format()
			end, { desc = 'Format current buffer with LSP' })
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Setup LSP servers using vim.lsp.enable
		local servers = {
			gopls = {},
			pyright = {},
			ts_ls = {
				cmd = { "fnm", "exec", "--using=default", "typescript-language-server", "--stdio" },
			},
			ansiblels = {},
		}

		for server, config in pairs(servers) do
			vim.lsp.enable(server, {
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = config.cmd,
			})
		end
	end
}
