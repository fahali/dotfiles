return {
  -- NOTE: https://github.com/saghen/blink.cmp
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  dependencies = {
    {
      -- NOTE: https://github.com/L3MON4D3/LuaSnip
      "L3MON4D3/LuaSnip",
      version = "2.*",
      builds = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      dependencies = {
        -- TODO: enable the following for more premade snippets
        --[[
        {
          -- NOTE: https://github.com/rafamadriz/friendly-snippets
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
        ]]
      },
      opts = {},
    },
  },
  ---@module 'blink.cmp',
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
    },

    appearance = {
      nerd_font_variant = "normal",
    },

    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { "lsp", "path", "snippets" },
    },

    snippets = { preset = "luasnip" },

    -- NOTE: can switch to Rust fuzzy match with 'prefer_rust_with_warning'
    fuzzy = { implementation = "lua" },

    signature = { enabled = true },
  },
}
