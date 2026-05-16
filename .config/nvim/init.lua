vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', space = '·', trail = '·', nbsp = '␣' }
vim.o.scrolloff = 10

vim.o.undofile = true
vim.o.confirm = true
vim.o.inccommand = 'split'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = true,
  virtual_lines = false,
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focuse = false,
      }
    end,
  },
}
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus below' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus above' })

vim.keymap.set('n', '-', '<cmd>Explore<CR>', { desc = 'Open file explorer' })
vim.keymap.set('n', '<BS>', '<cmd>confirm bdelete<CR>', { desc = 'Close a buffer' })
vim.keymap.set('n', '<F9>', '<cmd>restart<CR>', { desc = 'Write the current buffer' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-on-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  group = vim.api.nvim_create_augroup('help-as-buffer', { clear = true }),
  callback = function()
    vim.cmd [[ only ]]
    vim.bo.buflisted = true
  end,
})

local gh = function(plugin) return 'https://github.com/' .. plugin end

vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('pack-change-hook', { clear = true }),
  callback = function(event)
    local name, kind = event.data.spec.name, event.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then vim.cmd [[ TSUpdate ]] end
  end,
})

vim.pack.add {
  { src = gh 'Shatur/neovim-ayu' },
  { src = gh 'mason-org/mason.nvim' },
  { src = gh 'stevearc/conform.nvim' },
  { src = gh 'fahali/nvim-treesitter' },
  { src = gh 'neovim/nvim-lspconfig' },
}

local ayu = require 'ayu'
ayu.setup {
  mirage = true,
  overrides = {
    Normal = { bg = 'None' },
    NormalFloat = { bg = 'None' },
  },
}
ayu.colorscheme()

require('mason').setup()
require('conform').setup {
  formatters_by_ft = {
    fish = { 'fish_indent' },
    lua = { 'stylua' },
    toml = { 'tombi' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}

require('nvim-treesitter').install { 'bash', 'fish', 'lua', 'toml' }

vim.lsp.enable 'lua_ls'
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

vim.lsp.enable 'tombi'
vim.lsp.config('tombi', {
  cmd = { 'tombi', 'lsp' },
  filetypes = { 'toml' },
  root_markers = { 'tombi.toml', 'pyproject.toml', '.git' },
})
