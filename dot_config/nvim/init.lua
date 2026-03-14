vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.o.termguicolors = true

vim.o.number = true
vim.wo.relativenumber = true

vim.o.mouse = 'a'

vim.o.showmode = false

-- NOTE: maybe one day we don't want to sync with system clipboard
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.o.breakindent = true

-- NOTE: 'base' Neovim indentation set at 4 whitespace characters
-- ftplugin/make.lua overrides with 8 character wide tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- TODO: install undotree?
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', space = '·', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.diagnostic.config {
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    -- NOTE: inlay hints
    virtual_text = true,
    virtual_lines = false,

    jump = { float = true },
}

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: use <C-\><C-n> if this doesn't work
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: quality of life keymaps
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus below' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus above' })

vim.keymap.set('n', '<BS>', '<cmd>confirm bdelete<CR>', { desc = 'Close a buffer' })
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Write the current buffer' })

vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' })

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'help',
    callback = function()
        vim.cmd 'only'
        vim.bo.buflisted = true
    end,
})

require 'config.lazy'

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
