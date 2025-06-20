if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- ===================================================================
-- CORE NAVIGATION & EDITING
-- ===================================================================

-- Buffer navigation (like LazyVim)
vim.keymap.set("n", "<S-Left>", function()
  vscode.action("workbench.action.previousEditor")
end, { desc = "Prev Buffer" })

vim.keymap.set("n", "<S-Right>", function()
  vscode.action("workbench.action.nextEditor")
end, { desc = "Next Buffer" })

vim.keymap.set("n", "[b", function()
  vscode.action("workbench.action.previousEditor")
end, { desc = "Prev Buffer" })

vim.keymap.set("n", "]b", function()
  vscode.action("workbench.action.nextEditor")
end, { desc = "Next Buffer" })

-- Window navigation (LazyVim defaults)
vim.keymap.set("n", "<C-Left>", function()
  vscode.action("workbench.action.focusLeftGroup")
end, { desc = "Go to Left Window" })

vim.keymap.set("n", "<C-Down>", function()
  vscode.action("workbench.action.focusBelowGroup")
end, { desc = "Go to Lower Window" })

vim.keymap.set("n", "<C-Up>", function()
  vscode.action("workbench.action.focusAboveGroup")
end, { desc = "Go to Upper Window" })

vim.keymap.set("n", "<C-Right>", function()
  vscode.action("workbench.action.focusRightGroup")
end, { desc = "Go to Right Window" })

-- ===================================================================
-- LEADER KEY MAPPINGS (matching LazyVim)
-- ===================================================================

-- File operations
vim.keymap.set("n", "<leader><space>", function()
  vscode.action("workbench.action.quickOpen")
end, { desc = "Find Files (Root Dir)" })

vim.keymap.set("n", "<leader>ff", function()
  vscode.action("workbench.action.quickOpen")
end, { desc = "Find Files (Root Dir)" })

vim.keymap.set("n", "<leader>fr", function()
  vscode.action("workbench.action.openRecent")
end, { desc = "Recent" })

vim.keymap.set("n", "<leader>fn", function()
  vscode.action("workbench.action.files.newUntitledFile")
end, { desc = "New File" })

-- Search operations
vim.keymap.set("n", "<leader>/", function()
  vscode.action("workbench.action.findInFiles")
end, { desc = "Grep (Root Dir)" })

vim.keymap.set("n", "<leader>sg", function()
  vscode.action("workbench.action.findInFiles")
end, { desc = "Grep (Root Dir)" })

vim.keymap.set("n", "<leader>ss", function()
  vscode.action("workbench.action.gotoSymbol")
end, { desc = "Goto Symbol" })

vim.keymap.set("n", "<leader>sk", function()
  vscode.action("workbench.action.openGlobalKeybindings")
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>sc", function()
  vscode.action("workbench.action.showCommands")
end, { desc = "Commands" })

-- Buffer operations
vim.keymap.set("n", "<leader>bb", function()
  vscode.action("workbench.action.showAllEditors")
end, { desc = "Switch to Other Buffer" })

vim.keymap.set("n", "<leader>`", function()
  vscode.action("workbench.action.quickOpenPreviousRecentlyUsedEditor")
end, { desc = "Switch to Other Buffer" })

vim.keymap.set("n", "<leader>bd", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>bo", function()
  vscode.action("workbench.action.closeOtherEditors")
end, { desc = "Delete Other Buffers" })

-- Code operations
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
  vscode.action("editor.action.quickFix")
end, { desc = "Code Action" })

vim.keymap.set({ "n", "x" }, "<leader>cr", function()
  vscode.action("editor.action.rename")
end, { desc = "Rename" })

vim.keymap.set("n", "<leader>cf", function()
  vscode.action("editor.action.formatDocument")
end, { desc = "Format" })

vim.keymap.set("x", "<leader>cf", function()
  vscode.action("editor.action.formatSelection")
end, { desc = "Format" })

-- Diagnostics
vim.keymap.set("n", "<leader>cd", function()
  vscode.action("editor.action.marker.nextInFiles")
end, { desc = "Line Diagnostics" })

vim.keymap.set("n", "]d", function()
  vscode.action("editor.action.marker.nextInFiles")
end, { desc = "Next Diagnostic" })

vim.keymap.set("n", "[d", function()
  vscode.action("editor.action.marker.prevInFiles")
end, { desc = "Prev Diagnostic" })

-- Git operations
vim.keymap.set("n", "<leader>gg", function()
  vscode.action("workbench.view.scm")
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>gb", function()
  vscode.action("gitlens.toggleLineBlame")
end, { desc = "Git Blame Line" })

-- Explorer
vim.keymap.set("n", "<leader>e", function()
  -- Always just open/focus the explorer - the VSCode keybinding handles closing when focused
  vscode.action("workbench.view.explorer")
end, { desc = "Toggle Explorer" })

-- Terminal
vim.keymap.set("n", "<leader>ft", function()
  vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set("n", "<c-/>", function()
  vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Terminal (Root Dir)" })

-- Splits
vim.keymap.set("n", "<leader>-", function()
  vscode.action("workbench.action.splitEditorDown")
end, { desc = "Split Window Below" })

vim.keymap.set("n", "<leader>|", function()
  vscode.action("workbench.action.splitEditorRight")
end, { desc = "Split Window Right" })

vim.keymap.set("n", "<leader>wd", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Delete Window" })

-- Tabs
vim.keymap.set("n", "<leader><tab><tab>", function()
  vscode.action("workbench.action.newGroupRight")
end, { desc = "New Tab" })

vim.keymap.set("n", "<leader><tab>d", function()
  vscode.action("workbench.action.closeEditorsInGroup")
end, { desc = "Close Tab" })

vim.keymap.set("n", "<leader><tab>]", function()
  vscode.action("workbench.action.nextEditorInGroup")
end, { desc = "Next Tab" })

vim.keymap.set("n", "<leader><tab>[", function()
  vscode.action("workbench.action.previousEditorInGroup")
end, { desc = "Previous Tab" })

-- Quit
vim.keymap.set("n", "<leader>qq", function()
  vscode.action("workbench.action.quit")
end, { desc = "Quit All" })

-- Notifications
vim.keymap.set("n", "<leader>un", function()
  vscode.action("notifications.clearAll")
end, { desc = "Dismiss All Notifications" })

-- Toggle UI elements
vim.keymap.set("n", "<leader>uf", function()
  vscode.action("editor.action.toggleWordWrap")
end, { desc = "Toggle Format" })

vim.keymap.set("n", "<leader>uw", function()
  vscode.action("editor.action.toggleWordWrap")
end, { desc = "Toggle Wrap" })

-- Zen mode
vim.keymap.set("n", "<leader>uz", function()
  vscode.action("workbench.action.toggleZenMode")
end, { desc = "Toggle Zen Mode" })

-- ===================================================================
-- LSP MAPPINGS (matching LazyVim)
-- ===================================================================

vim.keymap.set("n", "gd", function()
  vscode.action("editor.action.revealDefinition")
end, { desc = "Goto Definition" })

vim.keymap.set("n", "gr", function()
  vscode.action("editor.action.goToReferences")
end, { desc = "References" })

vim.keymap.set("n", "gI", function()
  vscode.action("editor.action.goToImplementation")
end, { desc = "Goto Implementation" })

vim.keymap.set("n", "gy", function()
  vscode.action("editor.action.goToTypeDefinition")
end, { desc = "Goto T[y]pe Definition" })

vim.keymap.set("n", "gD", function()
  vscode.action("editor.action.revealDeclaration")
end, { desc = "Goto Declaration" })

vim.keymap.set("n", "K", function()
  vscode.action("editor.action.showHover")
end, { desc = "Hover" })

vim.keymap.set("n", "gK", function()
  vscode.action("editor.action.triggerParameterHints")
end, { desc = "Signature Help" })

vim.keymap.set("i", "<c-k>", function()
  vscode.action("editor.action.triggerParameterHints")
end, { desc = "Signature Help" })

-- ===================================================================
-- UNDO/REDO SYNC WITH VSCODE
-- ===================================================================

vim.keymap.set("n", "u", function()
  vscode.action("undo")
end, { desc = "Undo" })

vim.keymap.set("n", "<C-r>", function()
  vscode.action("redo")
end, { desc = "Redo" })

-- Clear search highlighting
vim.keymap.set({ "i", "n", "s" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", function()
  vscode.action("workbench.action.files.save")
end, { desc = "Save File" })

-- ===================================================================
-- PROJECT MANAGER (Harpoon-like for projects)
-- ===================================================================

-- Project list and navigation (similar to harpoon)
vim.keymap.set("n", "<leader>ml", function()
  vscode.action("projectManager.listProjects")
end, { desc = "List Projects" })

vim.keymap.set("n", "<leader>mn", function()
  vscode.action("projectManager.listProjectsNewWindow")
end, { desc = "List Projects (New Window)" })

-- Save current project
vim.keymap.set("n", "<leader>ms", function()
  vscode.action("projectManager.saveProject")
end, { desc = "Save Project" })

-- Edit projects file
vim.keymap.set("n", "<leader>me", function()
  vscode.action("projectManager.editProjects")
end, { desc = "Edit Projects" })

-- Filter by tags
vim.keymap.set("n", "<leader>mt", function()
  vscode.action("projectManager.filterProjectsByTag")
end, { desc = "Filter by Tag" })

-- Open folder as new project
vim.keymap.set("n", "<leader>mf", function()
  vscode.action("workbench.action.files.openFolder")
end, { desc = "Open Folder" })

-- Quick project access (numbers like harpoon)
vim.keymap.set("n", "<leader>m1", function()
  vscode.action("projectManager.listProjects")
end, { desc = "Project 1" })

vim.keymap.set("n", "<leader>m2", function()
  vscode.action("projectManager.listProjects")
end, { desc = "Project 2" })

vim.keymap.set("n", "<leader>m3", function()
  vscode.action("projectManager.listProjects")
end, { desc = "Project 3" })

vim.keymap.set("n", "<leader>m4", function()
  vscode.action("projectManager.listProjects")
end, { desc = "Project 4" })

vim.keymap.set("n", "<leader>m5", function()
  vscode.action("projectManager.listProjects")
end, { desc = "Project 5" })

vim.keymap.set("n", "<leader>m6", function()
  vscode.action("projectManager.listProjects")
end, { desc = "Project 6" })

vim.keymap.set("n", "<leader>m7", function()
  vscode.action("projectManager.listProjects")
end, { desc = "Project 7" })

vim.keymap.set("n", "<leader>m8", function()
  vscode.action("projectManager.listProjects")
end, { desc = "Project 8" })

vim.keymap.set("n", "<leader>m9", function()
  vscode.action("projectManager.listProjects")
end, { desc = "Project 9" })
