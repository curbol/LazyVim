-- File and explorer keymaps for VSCode
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- File explorer
vim.keymap.set("n", "<leader>fe", function()
  vscode.action("workbench.view.explorer")
end, { desc = "Explorer" })

vim.keymap.set("n", "<leader>fE", function()
  vscode.action("workbench.action.toggleSidebarVisibility")
end, { desc = "Toggle Explorer" })

-- File operations
vim.keymap.set("n", "<leader>fn", function()
  vscode.action("explorer.newFile")
end, { desc = "New File" })

vim.keymap.set("n", "<leader>fN", function()
  vscode.action("explorer.newFolder")
end, { desc = "New Folder" })

vim.keymap.set("n", "<leader>fr", function()
  vscode.action("workbench.action.openRecent")
end, { desc = "Recent Files" })

vim.keymap.set("n", "<leader>ff", function()
  vscode.action("workbench.action.quickOpen")
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fF", function()
  vscode.action("workbench.action.showAllEditors")
end, { desc = "Find Open Files" })

-- File management
vim.keymap.set("n", "<leader>fs", function()
  vscode.action("workbench.action.files.save")
end, { desc = "Save File" })

vim.keymap.set("n", "<leader>fS", function()
  vscode.action("workbench.action.files.saveAll")
end, { desc = "Save All Files" })

vim.keymap.set("n", "<leader>fy", function()
  vscode.action("copyFilePath")
end, { desc = "Copy File Path" })

vim.keymap.set("n", "<leader>fY", function()
  vscode.action("copyRelativeFilePath")
end, { desc = "Copy Relative File Path" })

-- Terminal
vim.keymap.set("n", "<leader>ft", function()
  vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set("n", "<c-/>", function()
  vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set("n", "<leader>fT", function()
  vscode.action("workbench.action.terminal.new")
end, { desc = "New Terminal" })
