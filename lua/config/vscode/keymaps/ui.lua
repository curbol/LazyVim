-- UI and editor toggles keymaps for VSCode
if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- UI toggles
vim.keymap.set("n", "<leader>uz", function()
  vscode.action("workbench.action.toggleZenMode")
end, { desc = "Toggle Zen Mode" })

vim.keymap.set("n", "<leader>uf", function()
  vscode.action("workbench.action.toggleFullScreen")
end, { desc = "Toggle Full Screen" })

vim.keymap.set("n", "<leader>us", function()
  vscode.action("workbench.action.toggleSidebarVisibility")
end, { desc = "Toggle Sidebar" })

vim.keymap.set("n", "<leader>up", function()
  vscode.action("workbench.action.togglePanel")
end, { desc = "Toggle Panel" })

vim.keymap.set("n", "<leader>ua", function()
  vscode.action("workbench.action.toggleActivityBarVisibility")
end, { desc = "Toggle Activity Bar" })

vim.keymap.set("n", "<leader>ut", function()
  vscode.action("workbench.action.toggleStatusbarVisibility")
end, { desc = "Toggle Status Bar" })

-- Editor toggles
vim.keymap.set("n", "<leader>uw", function()
  vscode.action("editor.action.toggleWordWrap")
end, { desc = "Toggle Word Wrap" })

vim.keymap.set("n", "<leader>ul", function()
  vscode.action("editor.action.toggleRenderWhitespace")
end, { desc = "Toggle Whitespace" })

vim.keymap.set("n", "<leader>un", function()
  vscode.action("editor.action.showLineNumbers")
end, { desc = "Toggle Line Numbers" })

vim.keymap.set("n", "<leader>ur", function()
  vscode.action("editor.action.toggleRenderControlCharacter")
end, { desc = "Toggle Control Characters" })

vim.keymap.set("n", "<leader>ui", function()
  vscode.action("editor.action.toggleTabFocusMode")
end, { desc = "Toggle Tab Focus Mode" })

-- Minimap and breadcrumbs
vim.keymap.set("n", "<leader>um", function()
  vscode.action("editor.action.toggleMinimap")
end, { desc = "Toggle Minimap" })

vim.keymap.set("n", "<leader>ub", function()
  vscode.action("breadcrumbs.toggle")
end, { desc = "Toggle Breadcrumbs" })

-- Theme and appearance
vim.keymap.set("n", "<leader>uc", function()
  vscode.action("workbench.action.selectTheme")
end, { desc = "Change Color Theme" })

vim.keymap.set("n", "<leader>uC", function()
  vscode.action("workbench.action.selectIconTheme")
end, { desc = "Change Icon Theme" })

-- Settings
vim.keymap.set("n", "<leader>u,", function()
  vscode.action("workbench.action.openSettings")
end, { desc = "Open Settings" })

vim.keymap.set("n", "<leader>uk", function()
  vscode.action("workbench.action.openGlobalKeybindings")
end, { desc = "Open Keybindings" })
