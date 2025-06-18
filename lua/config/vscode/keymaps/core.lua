-- Core editor keymaps for VSCode
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- Keep undo/redo synchronized with VSCode
vim.keymap.set("n", "u", function()
  vscode.action("undo")
end, { desc = "Undo" })

vim.keymap.set("n", "<C-r>", function()
  vscode.action("redo")
end, { desc = "Redo" })

-- Command palette
vim.keymap.set("n", "<leader>:", function()
  vscode.action("workbench.action.showCommands")
end, { desc = "Command Palette" })

-- Quick actions
vim.keymap.set("n", "<leader><leader>", function()
  vscode.action("workbench.action.quickOpen")
end, { desc = "Quick Open" })

-- Notifications
vim.keymap.set("n", "<leader>un", function()
  vscode.action("notifications.toggleList")
end, { desc = "Toggle Notifications" })

vim.keymap.set("n", "<leader>uN", function()
  vscode.action("notifications.clearAll")
end, { desc = "Clear All Notifications" })

-- Focus management
vim.keymap.set("n", "<Esc>", function()
  vscode.action("workbench.action.focusActiveEditorGroup")
end, { desc = "Focus Editor" })

-- Save all
vim.keymap.set("n", "<C-s>", function()
  vscode.action("workbench.action.files.save")
end, { desc = "Save File" })

-- Close editor
vim.keymap.set("n", "<C-w>", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close Editor" })

-- Extensions
vim.keymap.set("n", "<leader>pe", function()
  vscode.action("workbench.view.extensions")
end, { desc = "Extensions" })

-- Output and debug console
vim.keymap.set("n", "<leader>po", function()
  vscode.action("workbench.action.output.toggleOutput")
end, { desc = "Toggle Output" })

vim.keymap.set("n", "<leader>pd", function()
  vscode.action("workbench.debug.action.toggleRepl")
end, { desc = "Toggle Debug Console" })
