-- Diagnostics and problem management keymaps for VSCode
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- Diagnostics/Problems view
vim.keymap.set("n", "<leader>xd", function()
  vscode.action("workbench.actions.view.problems")
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>xx", function()
  vscode.action("workbench.actions.view.problems")
end, { desc = "Problems" })

-- Diagnostic navigation
vim.keymap.set("n", "]d", function()
  vscode.action("editor.action.marker.next")
end, { desc = "Next Diagnostic" })

vim.keymap.set("n", "[d", function()
  vscode.action("editor.action.marker.prev")
end, { desc = "Prev Diagnostic" })

vim.keymap.set("n", "]e", function()
  vscode.action("editor.action.marker.nextInFiles")
end, { desc = "Next Error" })

vim.keymap.set("n", "[e", function()
  vscode.action("editor.action.marker.prevInFiles")
end, { desc = "Prev Error" })

-- Diagnostic actions
vim.keymap.set("n", "<leader>xl", function()
  vscode.action("workbench.actions.view.problems")
end, { desc = "Location List" })

vim.keymap.set("n", "<leader>xq", function()
  vscode.action("workbench.actions.view.problems")
end, { desc = "Quickfix List" })

-- Error lens toggle (if available)
vim.keymap.set("n", "<leader>xe", function()
  vscode.action("errorLens.toggle")
end, { desc = "Toggle Error Lens" })
