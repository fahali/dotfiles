return {
    -- NOTE: https://github.com/rebelot/kanagawa.nvim
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function() vim.cmd.colorscheme 'kanagawa' end,
}
