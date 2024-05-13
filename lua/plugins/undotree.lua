return {
  "mbbill/undotree",
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
  cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus" },
  keys = {
    { "<Leader>cu", "<cmd>UndotreeToggle<CR>", desc = "Undo Tree" },
  },
}
