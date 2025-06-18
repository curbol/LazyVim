-- Code actions and LSP-like functionality for VSCode
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- Code actions
vim.keymap.set({ "n", "v" }, "<leader>ca", function()
  vscode.action("editor.action.quickFix")
end, { desc = "Code Action" })

vim.keymap.set("n", "<leader>cr", function()
  vscode.action("editor.action.rename")
end, { desc = "Rename" })

-- Formatting
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  vscode.action("editor.action.formatDocument")
end, { desc = "Format Document" })

vim.keymap.set("v", "<leader>cF", function()
  vscode.action("editor.action.formatSelection")
end, { desc = "Format Selection" })

-- Code navigation
vim.keymap.set("n", "gd", function()
  vscode.action("editor.action.revealDefinition")
end, { desc = "Go to Definition" })

vim.keymap.set("n", "gD", function()
  vscode.action("editor.action.peekDefinition")
end, { desc = "Peek Definition" })

vim.keymap.set("n", "gr", function()
  vscode.action("editor.action.goToReferences")
end, { desc = "Go to References" })

vim.keymap.set("n", "gI", function()
  vscode.action("editor.action.goToImplementation")
end, { desc = "Go to Implementation" })

vim.keymap.set("n", "gy", function()
  vscode.action("editor.action.goToTypeDefinition")
end, { desc = "Go to Type Definition" })

-- Hover and documentation
vim.keymap.set("n", "K", function()
  vscode.action("editor.action.showHover")
end, { desc = "Show Hover" })

-- Refactoring with insert mode support
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
  vscode.with_insert(function()
    vscode.action("editor.action.refactor")
  end)
end, { desc = "Refactor" })

vim.keymap.set({ "n", "x" }, "<leader>rs", function()
  vscode.action("editor.action.sourceAction")
end, { desc = "Source Action" })

-- Multi-cursor support using vscode-neovim's native multi-cursor features
vim.keymap.set({ "n", "x" }, "<C-d>", function()
  vscode.with_insert(function()
    vscode.action("editor.action.addSelectionToNextFindMatch")
  end)
end, { desc = "Add Selection to Next Find Match" })

vim.keymap.set({ "n", "x" }, "<C-S-d>", function()
  vscode.action("editor.action.addSelectionToPreviousFindMatch")
end, { desc = "Add Selection to Previous Find Match" })

-- Comments
vim.keymap.set({ "n", "v" }, "<leader>c<space>", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Toggle Comment Line" })

vim.keymap.set("v", "<leader>cb", function()
  vscode.action("editor.action.blockComment")
end, { desc = "Toggle Block Comment" })
