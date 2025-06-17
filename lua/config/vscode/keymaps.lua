-- VSCode-specific keymaps

if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- File operations
vim.keymap.set("n", "<leader>ff", function()
  vscode.action("workbench.action.quickOpen")
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fg", function()
  vscode.action("workbench.action.findInFiles")
end, { desc = "Find in Files" })

vim.keymap.set("n", "<leader>fc", function()
  vscode.action("workbench.action.showCommands")
end, { desc = "Command Palette" })

-- Buffer/Tab management
vim.keymap.set("n", "<leader>bd", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close Buffer" })

vim.keymap.set("n", "<S-h>", function()
  vscode.action("workbench.action.previousEditor")
end, { desc = "Previous Tab" })

vim.keymap.set("n", "<S-l>", function()
  vscode.action("workbench.action.nextEditor")
end, { desc = "Next Tab" })

-- Code actions
vim.keymap.set({ "n", "v" }, "<leader>ca", function()
  vscode.action("editor.action.quickFix")
end, { desc = "Code Actions" })

vim.keymap.set("n", "<leader>cr", function()
  vscode.action("editor.action.rename")
end, { desc = "Rename Symbol" })

-- Formatting
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  vscode.action("editor.action.formatDocument")
end, { desc = "Format Document" })

-- Splits
vim.keymap.set("n", "<leader>-", function()
  vscode.action("workbench.action.splitEditorDown")
end, { desc = "Split Below" })

vim.keymap.set("n", "<leader>|", function()
  vscode.action("workbench.action.splitEditorRight")
end, { desc = "Split Right" })

-- Explorer
vim.keymap.set("n", "<leader>e", function()
  vscode.action("workbench.action.toggleSidebarVisibility")
end, { desc = "Toggle Explorer" })

-- Comments (using VSCode's toggle)
vim.keymap.set({ "n", "v" }, "<leader>/", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Toggle Comment" })

-- Search and replace
vim.keymap.set("n", "<leader>sr", function()
  vscode.action("editor.action.startFindReplaceAction")
end, { desc = "Search and Replace" })

-- Symbols
vim.keymap.set("n", "<leader>ss", function()
  vscode.action("workbench.action.gotoSymbol")
end, { desc = "Go to Symbol" })

-- Git integration
vim.keymap.set("n", "<leader>gg", function()
  vscode.action("workbench.view.scm")
end, { desc = "Git View" })

vim.keymap.set("n", "<leader>gc", function()
  vscode.action("git.commit")
end, { desc = "Git Commit" })

-- Terminal
vim.keymap.set("n", "<leader>ft", function()
  vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Toggle Terminal" })

-- Panel management
vim.keymap.set("n", "<leader>tp", function()
  vscode.action("workbench.action.togglePanel")
end, { desc = "Toggle Panel" })

-- Zen mode
vim.keymap.set("n", "<leader>uz", function()
  vscode.action("workbench.action.toggleZenMode")
end, { desc = "Toggle Zen Mode" })

-- Harpoon keybindings for VSCode
vim.keymap.set("n", "<leader>h", function()
  vscode.action("vscode-harpoon.editorQuickPick")
end, { desc = "Harpoon Quick Pick" })

vim.keymap.set("n", "<leader>H", function()
  vscode.action("vscode-harpoon.addEditor")
end, { desc = "Harpoon Add File" })

-- Jump to harpoon items 1-9 
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    vscode.action("vscode-harpoon.gotoEditor" .. i)
  end, { desc = "Harpoon to File " .. i })
end

-- Disable problematic default LazyVim keymaps that don't work well in VSCode
-- Remove LazyVim's default telescope keymaps since we're using VSCode's equivalents
pcall(vim.keymap.del, "n", "<leader><space>")
pcall(vim.keymap.del, "n", "<leader>,")
-- Note: We're keeping "<leader>/" for our VSCode comment toggle above
