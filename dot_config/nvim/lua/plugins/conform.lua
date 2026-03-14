return {
    -- NOTE: https://github.com/stevearc/conform.nvim
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>f',
            function() require('conform').format { async = true, lsp_format = 'fallback' } end,
            mode = '',
            desc = '[F]ormat buffer',
        },
    },
    ---@module 'conform'
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            -- NOTE: for languages without standardized style guidelines
            local disable_filetypes = { c = true, cpp = true }
            if disable_filetypes[vim.bo[bufnr].filetype] then
                return nil
            else
                return {
                    timeout_ms = 500,
                    lsp_format = 'fallback',
                }
            end
        end,
        formatters_by_ft = {
            -- NOTE: install other formatters here
            fish = { 'fish_indent' },
            java = { 'google-java-format' },
            lua = { 'stylua' },
            rust = { 'rustfmt' },
            toml = { 'tombi' },
        },
        formatters = {
            google_java_format = {
                append_args = {
                    '--aosp',
                },
            },
        },
    },
}
