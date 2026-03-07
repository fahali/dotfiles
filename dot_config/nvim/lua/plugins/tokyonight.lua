return {
    -- NOTE: https://github.com/folke/tokyonight.nvim
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function() vim.cmd.colorscheme 'tokyonight' end,
}
