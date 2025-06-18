-- Git integration keymaps for VSCode
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- Git views and panels
vim.keymap.set("n", "<leader>gg", function()
  vscode.action("workbench.view.scm")
end, { desc = "Source Control" })

vim.keymap.set("n", "<leader>gs", function()
  vscode.action("workbench.view.scm")
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>gb", function()
  vscode.action("gitlens.showQuickFileHistory")
end, { desc = "Git Blame/History" })

-- Hunk navigation
vim.keymap.set("n", "]h", function()
  vscode.action("workbench.action.editor.nextChange")
end, { desc = "Next Hunk" })

vim.keymap.set("n", "[h", function()
  vscode.action("workbench.action.editor.previousChange")
end, { desc = "Prev Hunk" })

-- Git actions
vim.keymap.set("n", "<leader>ga", function()
  vscode.action("git.stage")
end, { desc = "Stage Hunk" })

vim.keymap.set("n", "<leader>gu", function()
  vscode.action("git.unstage")
end, { desc = "Unstage Hunk" })

vim.keymap.set("n", "<leader>gr", function()
  vscode.action("git.revertSelectedRanges")
end, { desc = "Revert Hunk" })

vim.keymap.set("n", "<leader>gS", function()
  vscode.action("git.stageAll")
end, { desc = "Stage All" })

vim.keymap.set("n", "<leader>gU", function()
  vscode.action("git.unstageAll")
end, { desc = "Unstage All" })

-- Commits
vim.keymap.set("n", "<leader>gc", function()
  vscode.action("git.commit")
end, { desc = "Commit" })

vim.keymap.set("n", "<leader>gC", function()
  vscode.action("git.commitAll")
end, { desc = "Commit All" })

-- Branches
vim.keymap.set("n", "<leader>gB", function()
  vscode.action("git.checkout")
end, { desc = "Checkout Branch" })

vim.keymap.set("n", "<leader>gp", function()
  vscode.action("git.push")
end, { desc = "Push" })

vim.keymap.set("n", "<leader>gP", function()
  vscode.action("git.pull")
end, { desc = "Pull" })
