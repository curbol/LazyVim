-- Window and workspace management keymaps for VSCode
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- Window navigation
vim.keymap.set("n", "<leader>ww", function()
  vscode.action("workbench.action.focusNextGroup")
end, { desc = "Other Window" })

vim.keymap.set("n", "<leader>wh", function()
  vscode.action("workbench.action.focusLeftGroup")
end, { desc = "Focus Left Window" })

vim.keymap.set("n", "<leader>wl", function()
  vscode.action("workbench.action.focusRightGroup")
end, { desc = "Focus Right Window" })

vim.keymap.set("n", "<leader>wk", function()
  vscode.action("workbench.action.focusAboveGroup")
end, { desc = "Focus Above Window" })

vim.keymap.set("n", "<leader>wj", function()
  vscode.action("workbench.action.focusBelowGroup")
end, { desc = "Focus Below Window" })

-- Window management
vim.keymap.set("n", "<leader>wd", function()
  vscode.action("workbench.action.closeEditorsInGroup")
end, { desc = "Delete Window" })

vim.keymap.set("n", "<leader>wo", function()
  vscode.action("workbench.action.joinTwoGroups")
end, { desc = "Close Other Windows" })

-- Window splitting
vim.keymap.set("n", "<leader>w-", function()
  vscode.action("workbench.action.splitEditorDown")
end, { desc = "Split Window Below" })

vim.keymap.set("n", "<leader>w|", function()
  vscode.action("workbench.action.splitEditor")
end, { desc = "Split Window Right" })

vim.keymap.set("n", "<leader>ws", function()
  vscode.action("workbench.action.splitEditor")
end, { desc = "Split Window Right" })

vim.keymap.set("n", "<leader>wv", function()
  vscode.action("workbench.action.splitEditorDown")
end, { desc = "Split Window Below" })

-- Window sizing
vim.keymap.set("n", "<leader>w=", function()
  vscode.action("workbench.action.evenEditorWidths")
end, { desc = "Balance Windows" })

vim.keymap.set("n", "<leader>w+", function()
  vscode.action("workbench.action.increaseViewSize")
end, { desc = "Increase Window Size" })

vim.keymap.set("n", "<leader>w-", function()
  vscode.action("workbench.action.decreaseViewSize")
end, { desc = "Decrease Window Size" })

-- Workspace management
vim.keymap.set("n", "<leader>wf", function()
  vscode.action("workbench.action.addRootFolder")
end, { desc = "Add Folder to Workspace" })

vim.keymap.set("n", "<leader>wr", function()
  vscode.action("workbench.action.removeRootFolder")
end, { desc = "Remove Folder from Workspace" })
