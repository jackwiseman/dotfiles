vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set highlight on search
vim.o.hlsearch = false

-- Set command height to 0, so it looks nice with tmux
vim.o.cmdheight = 0

-- Set relative number
vim.o.relativenumber = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Fold on indent
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99 -- arbitary, let's just hope isn't ever an issue

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


-- Keymaps for better default experience
-- Disable space in visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard:append("unnamed")

vim.g.rooter_patterns = {'.git', 'package.json'}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "vue,scss,javascript,sh,php",
	command = "setlocal shiftwidth=4 tabstop=4 expandtab"
})

vim.opt.fixeol = false
