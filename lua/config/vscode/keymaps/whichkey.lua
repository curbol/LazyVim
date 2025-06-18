local vscode = require("vscode")

-- Map space to trigger WhichKey in normal and visual modes
vim.keymap.set({ "n", "x" }, "<Space>", function()
  vscode.action("whichkey.show")
end, { noremap = true, silent = true, desc = "WhichKey" })

-- Make sure to clear any conflicting space mappings
vim.keymap.del("n", "<Space>", { silent = true })
vim.keymap.del("x", "<Space>", { silent = true })

-- Re-map space to WhichKey with better integration
vim.keymap.set({ "n", "x" }, "<leader>", function()
  -- Show VSCode's command palette if WhichKey extension is not available
  -- otherwise show WhichKey
  local ok = pcall(vscode.action, "whichkey.show")
  if not ok then
    vscode.action("workbench.action.showCommands")
  end
end, { noremap = true, silent = true, desc = "Show Commands" })