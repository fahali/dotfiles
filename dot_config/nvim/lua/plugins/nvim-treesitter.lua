return {
    -- NOTE: https://github.com/nvim-treesitter/nvim-treesitter.nvim
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main',
    config = function()
        -- NOTE: add more parsers here as needed
        local parsers = { 'lua', 'luadoc', 'vim', 'vimdoc' }
        require('nvim-treesitter').install(parsers)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = parsers,
            callback = function() vim.treesitter.start() end,
        })
    end,
}
