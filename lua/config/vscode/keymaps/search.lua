-- Search and navigation keymaps for VSCode
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- File finding and searching
vim.keymap.set("n", "<leader><space>", function()
  vscode.action("workbench.action.quickOpen")
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>/", function()
  vscode.action("workbench.action.findInFiles")
end, { desc = "Grep (Root Dir)" })

-- Symbol navigation
vim.keymap.set("n", "<leader>ss", function()
  vscode.action("workbench.action.gotoSymbol")
end, { desc = "Goto Symbol" })

vim.keymap.set("n", "<leader>sS", function()
  vscode.action("workbench.action.showAllSymbols")
end, { desc = "Goto Symbol (Workspace)" })

-- Recent files
vim.keymap.set("n", "<leader>fr", function()
  vscode.action("workbench.action.openRecent")
end, { desc = "Recent Files" })

-- Search in files with options
vim.keymap.set("n", "<leader>sw", function()
  vscode.action("workbench.action.findInFiles", {
    args = { query = vim.fn.expand("<cword>") }
  })
end, { desc = "Search Word Under Cursor" })
