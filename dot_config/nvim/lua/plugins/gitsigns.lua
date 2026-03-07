return {
  -- NOTE: https://github.com/lewis6991/gitsigns.nvim
  "lewis6991/gitsigns.nvim",
  ---@module 'gitsigns'
  ---@type Gitsigns.config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    --[[
    signs = {
      add = { text = "+" }, ---@diagnostic disable-line: missing-fields
      change = { text = "~" }, ---@diagnostic disable-line: missing-fields
      delete = { text = "_" }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = "‾" }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = "~" }, ---@diagnostic disable-line: missing-fields
    },
    ]]
  },
}
