return {
    -- NOTE: https://github.com/nvim-treesitter/nvim-treesitter.nvim
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'main',
    config = function()
        -- NOTE: add more parsers here as needed
        local parsers = { 'fish', 'java', 'lua', 'luadoc', 'rust', 'toml', 'vim', 'vimdoc' }
        require('nvim-treesitter').install(parsers)
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                local buf, filetype = args.buf, args.match

                local language = vim.treesitter.language.get_lang(filetype)
                if not language then return end

                if not vim.treesitter.language.add(language) then return end
                vim.treesitter.start(buf, language)

                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
