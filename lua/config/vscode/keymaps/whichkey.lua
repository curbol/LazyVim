-- Map space to trigger WhichKey in normal and visual modes
vim.keymap.set({ "n", "x" }, "<Space>", function()
  require("vscode").action("whichkey.show")
end, { noremap = true, silent = true, desc = "WhichKey" })
