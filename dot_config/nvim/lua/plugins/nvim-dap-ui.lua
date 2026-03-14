return {
    -- NOTE: https://github.com/rcarriga/nvim-dap-ui
    'rcarriga/nvim-dap-ui',
    lazy = true,
    dependencies = {
        -- NOTE: https://github.com/mfussenegger/nvim-dap
        'mfussenegger/nvim-dap',
        -- NOTE: https://github.com/nvim-neotest/nvim-nio
        'nvim-neotest/nvim-nio',
        -- NOTE: https://github.com/theHamsta/nvim-dap-virtual-text
        'theHamsta/nvim-dap-virtual-text',
        -- NOTE: https://github.com/nvim-telescope/telescope-dap.nvim
        'nvim-telescope/telescope-dap.nvim',
    },
    opts = {
        controls = {
            element = 'repl',
            enabled = false,
            icons = {
                -- TODO: finish setting icons
            },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            border = 'single',
            mappings = {
                close = { 'q', '<Esc>' },
            },
        },
        force_buffers = true,
        icons = {
            -- TODO: finish setting icons
        },
        layouts = {
            {
                elements = {
                    {
                        id = 'scopes',
                        size = 0.50,
                    },
                    {
                        id = 'stacks',
                        size = 0.30,
                    },
                    {
                        id = 'watches',
                        size = 0.10,
                    },
                    {
                        id = 'breakpoints',
                        size = 0.10,
                    },
                },
                size = 40,
                position = 'left',
            },
            {
                elements = {
                    'repl',
                    'console',
                },
                size = 10,
                position = 'bottom',
            },
        },
        mappings = {
            edit = 'e',
            expand = { '<CR>', '<2-LeftMouse>' },
            open = 'o',
            remove = 'd',
            repl = 'r',
            toggle = 't',
        },
        render = {
            indent = 1,
            max_value_lines = 100,
        },
    },
    config = function(_, opts)
        local dap = require 'dap'
        require('dapui').setup(opts)

        vim.api.nvim_set_hl(0, 'DapStoppedHl', { fg = '#98BB6C', bg = '#2A2A2A', bold = true })
        vim.api.nvim_set_hl(0, 'DapStoppedLineHl', { bg = '#204028', bold = true })
        -- TODO: finish setting breakpoint signs

        dap.listeners.after.event_initialized['dapui_config'] = function() require('dapui').open() end

        dap.listeners.before.event_terminated['dapui_config'] = function() end

        dap.listeners.before.event_exited['dapui_config'] = function() end

        dap.configurations.java = {
            {
                name = 'Debug Launch (2GB)',
                type = 'java',
                request = 'launch',
                vmArgs = '' .. '-Xmx2g',
            },
            {
                name = 'Debug Attach (8000)',
                type = 'java',
                request = 'attach',
                hostname = '127.0.0.1',
                post = 8000,
            },
            {
                name = 'Debug Attach (5005)',
                type = 'java',
                request = 'attach',
                hostname = '127.0.0.1',
                post = 5005,
            },
            --[[
            -- NOTE: add additional launch configs here
            {
                name = 'Custom Java Run Config',
                type = 'java',
                request = 'launch',

                -- for multi module projects
                -- projectName = 'projectName'
                mainClass = 'replace.with.fully.qualified.MainClass',

                vmArgs = '' .. '-Xmx2g',
            },
            ]]
        }
    end,
}
