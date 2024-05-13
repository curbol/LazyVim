return {
  "szw/vim-maximizer",
  cmd = {
    "MaximizerToggle",
  },
  keys = {
    { "<leader>wm", "<cmd>MaximizerToggle<cr>" },
  },
  config = function()
    vim.g.maximizer_set_default_mapping = 0
  end,
}
