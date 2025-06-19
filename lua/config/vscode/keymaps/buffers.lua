-- Buffer management keymaps for VSCode
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- Buffer navigation
vim.keymap.set("n", "<S-h>", function()
  vscode.action("workbench.action.previousEditor")
end, { desc = "Prev Buffer" })

vim.keymap.set("n", "<S-l>", function()
  vscode.action("workbench.action.nextEditor")
end, { desc = "Next Buffer" })

-- Buffer management
vim.keymap.set("n", "<leader>bd", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>bD", function()
  vscode.action("workbench.action.closeOtherEditors")
end, { desc = "Delete Other Buffers" })

vim.keymap.set("n", "<leader>ba", function()
  vscode.action("workbench.action.closeAllEditors")
end, { desc = "Delete All Buffers" })

vim.keymap.set("n", "<leader>bp", function()
  vscode.action("workbench.action.pinEditor")
end, { desc = "Pin Buffer" })

vim.keymap.set("n", "<leader>bP", function()
  vscode.action("workbench.action.unpinEditor")
end, { desc = "Unpin Buffer" })

-- Split management
vim.keymap.set("n", "<leader>bs", function()
  vscode.action("workbench.action.splitEditor")
end, { desc = "Split Buffer Right" })

vim.keymap.set("n", "<leader>bv", function()
  vscode.action("workbench.action.splitEditorDown")
end, { desc = "Split Buffer Below" })
