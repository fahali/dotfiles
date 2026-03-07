return {
  -- NOTE: https://github.com/nvim-neo-tree/neo-tree.nvim
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    -- NOTE: https://github.com/nvim-lua/plenary.nvim
    "nvim-lua/plenary.nvim",
    -- NOTE: https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons",
    -- NOTE: https://github.com/MunifTanjim/nui.nvim
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  keys = {
    { "\\", "<cmd>Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        window = {
          mappings = {
            ["\\"] = "close_window",
          },
        },
      },
    })

    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
  end,
}
