vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    callback = function(_) require('jdtls.setup').setup() end,
})
