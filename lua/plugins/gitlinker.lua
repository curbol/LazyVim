return {
  "ruifm/gitlinker.nvim",
  vscode = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {},
  keys = {
    { mode = { "n", "v" }, "<leader>gy", desc = "Copy GitHub URL" },
  },
}
