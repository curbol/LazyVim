if not vim.g.vscode then
  return
end

-- Set leader key explicitly for VSCode
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- ===================================================================
-- SMART WINDOW NAVIGATION (Enhanced)
-- ===================================================================

-- These will only trigger when in normal Neovim navigation mode
-- The VSCode keybindings.json handles the smart navigation between different areas

-- Basic window navigation (fallback when not in smart contexts)
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


-- Maximize editor - close all panels and sidebar
vim.keymap.set("n", "<leader>wm", function()
  -- Close sidebar if open
  vscode.action("workbench.action.closeSidebar")
  -- Close auxiliary bar (right sidebar) if open  
  vscode.action("workbench.action.closeAuxiliaryBar")
  -- Close panel (terminal/problems/output/debug console)
  vscode.action("workbench.action.closePanel")
  -- Focus on the editor
  vscode.action("workbench.action.focusActiveEditorGroup")
end, { desc = "Maximize Editor" })

-- Window navigation with vim-style hjkl
vim.keymap.set("n", "<leader><C-h>", function()
  vscode.action("workbench.action.focusLeftGroup")
end, { desc = "Go to Left Window" })

vim.keymap.set("n", "<leader><C-j>", function()
  vscode.action("workbench.action.focusBelowGroup")
end, { desc = "Go to Lower Window" })

vim.keymap.set("n", "<leader><C-k>", function()
  vscode.action("workbench.action.focusAboveGroup")
end, { desc = "Go to Upper Window" })

vim.keymap.set("n", "<leader><C-l>", function()
  vscode.action("workbench.action.focusRightGroup")
end, { desc = "Go to Right Window" })

-- ===================================================================
-- LEADER KEY MAPPINGS (matching LazyVim)
-- ===================================================================

-- Command Palette
vim.keymap.set("n", "<leader>:", function()
  vscode.action("workbench.action.showCommands")
end, { desc = "Command Palette" })

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

-- Explorer
vim.keymap.set("n", "<leader>e", function()
  -- Always just open/focus the explorer - the VSCode keybinding handles closing when focused
  vscode.action("workbench.view.explorer")
end, { desc = "Toggle Explorer" })

-- Terminal
vim.keymap.set("n", "<leader>fT", function()
  vscode.action("workbench.action.terminal.newInActiveWorkspace")
end, { desc = "Terminal (cwd)" })

vim.keymap.set("n", "<leader>ft", function()
  vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set("n", "<C-`>", function()
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
-- PROJECT MANAGER
-- ===================================================================

vim.keymap.set("n", "<leader>mr", function()
  vscode.action("workbench.action.openRecent")
end, { desc = "Recent Projects" })

vim.keymap.set("n", "<leader>mf", function()
  vscode.action("workbench.action.files.openFolder")
end, { desc = "Open Folder" })

vim.keymap.set("n", "<leader>mm", function()
  vscode.action("projectManager.listProjects")
end, { desc = "List Projects" })

vim.keymap.set("n", "<leader>ma", function()
  vscode.action("projectManager.saveProject")
end, { desc = "Save Project" })

vim.keymap.set("n", "<leader>me", function()
  vscode.action("projectManager.editProjects")
end, { desc = "Edit Projects" })

-- ===================================================================
-- COPILOT CHAT MAPPINGS (matching LazyVim)
-- ===================================================================
vim.keymap.set({ "n", "v" }, "<leader>a", "+ai", { desc = "+ai" })

vim.keymap.set({ "n", "v" }, "<leader>aa", function()
  vscode.action("workbench.action.chat.toggle")
end, { desc = "Toggle Chat (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>ai", function()
  vscode.action("workbench.action.chat.open")
end, { desc = "Open Chat (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>an", function()
  vscode.action("workbench.action.chat.open")
  vscode.action("workbench.action.chat.newChat")
end, { desc = "New Chat (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>aq", function()
  vscode.action("workbench.action.quickchat.toggle")
end, { desc = "Quick Chat (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>af", function()
  vscode.action("github.copilot.chat.attachFile")
end, { desc = "Add File to Context (CopilotChat)" })

-- ===================================================================
-- ADDITIONAL MAPPINGS FROM PLUGIN FILE
-- ===================================================================

-- Peek operations
vim.keymap.set("n", "gp", function()
  vscode.action("editor.action.peekDefinition")
end, { desc = "Peek Definition" })

vim.keymap.set("n", "gP", function()
  vscode.action("editor.action.peekDeclaration")
end, { desc = "Peek Declaration" })

-- Comment mappings
vim.keymap.set({ "v" }, "gc", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Comment" })

vim.keymap.set("n", "gcc", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Comment Line" })

-- Diagnostic navigation (errors/warnings)
vim.keymap.set("n", "]e", function()
  vscode.action("editor.action.marker.nextInFiles", { args = { severity = "Error" } })
end, { desc = "Next Error" })

vim.keymap.set("n", "[e", function()
  vscode.action("editor.action.marker.prevInFiles", { args = { severity = "Error" } })
end, { desc = "Prev Error" })

vim.keymap.set("n", "]w", function()
  vscode.action("editor.action.marker.nextInFiles", { args = { severity = "Warning" } })
end, { desc = "Next Warning" })

vim.keymap.set("n", "[w", function()
  vscode.action("editor.action.marker.prevInFiles", { args = { severity = "Warning" } })
end, { desc = "Prev Warning" })

-- Quickfix navigation
vim.keymap.set("n", "]q", function()
  vscode.action("search.action.focusNextSearchResult")
end, { desc = "Next Quickfix" })

vim.keymap.set("n", "[q", function()
  vscode.action("search.action.focusPreviousSearchResult")
end, { desc = "Previous Quickfix" })

-- Location list
vim.keymap.set("n", "<leader>xl", function()
  vscode.action("workbench.actions.view.problems")
end, { desc = "Location List" })

vim.keymap.set("n", "<leader>xq", function()
  vscode.action("workbench.actions.view.problems")
end, { desc = "Quickfix List" })

vim.keymap.set("n", "<leader>.", function()
  vscode.action("editor.action.quickFix")
end, { desc = "Quick Fix" })

-- Search and replace
vim.keymap.set("n", "<leader>sr", function()
  vscode.action("workbench.action.replaceInFiles")
end, { desc = "Search and Replace" })

-- Git operations
vim.keymap.set("n", "<leader>gg", function()
  vscode.action("workbench.view.scm")
end, { desc = "Git Status" })

vim.keymap.set("n", "<leader>gb", function()
  vscode.action("gitlens.toggleLineBlame")
end, { desc = "Git Blame Line" })

vim.keymap.set("n", "<leader>gf", function()
  vscode.action("git.fetch")
end, { desc = "Git Fetch" })

vim.keymap.set("n", "<leader>gp", function()
  vscode.action("git.pull")
end, { desc = "Git Pull" })

vim.keymap.set("n", "<leader>gP", function()
  vscode.action("git.push")
end, { desc = "Git Push" })

vim.keymap.set("n", "<leader>gc", function()
  vscode.action("git.commit")
end, { desc = "Git Commit" })

-- Debugging support
vim.keymap.set("n", "<leader>db", function()
  vscode.action("editor.debug.action.toggleBreakpoint")
end, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>dc", function()
  vscode.action("workbench.action.debug.continue")
end, { desc = "Continue" })

vim.keymap.set("n", "<leader>ds", function()
  vscode.action("workbench.action.debug.start")
end, { desc = "Start Debugging" })

vim.keymap.set("n", "<leader>dt", function()
  vscode.action("workbench.action.debug.stop")
end, { desc = "Stop Debugging" })

-- Notification management
vim.keymap.set("n", "<leader>nx", function()
  vscode.action("notifications.clearAll")
end, { desc = "Clear Notifications" })

vim.keymap.set("n", "<leader>nf", function()
  vscode.action("notifications.focusToasts")
end, { desc = "Focus Notifications" })

-- ===================================================================
-- HARPOON
-- ===================================================================

vim.keymap.set("n", "<leader>h", function()
  vscode.action("vscode-harpoon.editorQuickPick")
end, { desc = "Harpoon Quick Pick" })

vim.keymap.set("n", "<leader>hh", function()
  vscode.action("vscode-harpoon.editEditors")
end, { desc = "Edit Harpoon List" })

-- Keep the old leader+H for backward compatibility
vim.keymap.set("n", "<leader>H", function()
  vscode.action("vscode-harpoon.addEditor")
end, { desc = "Harpoon File" })

vim.keymap.set("n", "<leader>1", function()
  vscode.action("vscode-harpoon.gotoEditor1")
end, { desc = "Harpoon to File 1" })

vim.keymap.set("n", "<leader>2", function()
  vscode.action("vscode-harpoon.gotoEditor2")
end, { desc = "Harpoon to File 2" })

vim.keymap.set("n", "<leader>3", function()
  vscode.action("vscode-harpoon.gotoEditor3")
end, { desc = "Harpoon to File 3" })

vim.keymap.set("n", "<leader>4", function()
  vscode.action("vscode-harpoon.gotoEditor4")
end, { desc = "Harpoon to File 4" })

vim.keymap.set("n", "<leader>5", function()
  vscode.action("vscode-harpoon.gotoEditor5")
end, { desc = "Harpoon to File 5" })

vim.keymap.set("n", "<leader>6", function()
  vscode.action("vscode-harpoon.gotoEditor6")
end, { desc = "Harpoon to File 6" })

vim.keymap.set("n", "<leader>7", function()
  vscode.action("vscode-harpoon.gotoEditor7")
end, { desc = "Harpoon to File 7" })

vim.keymap.set("n", "<leader>8", function()
  vscode.action("vscode-harpoon.gotoEditor8")
end, { desc = "Harpoon to File 8" })

vim.keymap.set("n", "<leader>9", function()
  vscode.action("vscode-harpoon.gotoEditor9")
end, { desc = "Harpoon to File 9" })

-- ===================================================================
-- SMART NAVIGATION ENHANCEMENTS
-- ===================================================================

-- Quick panel toggles with escape back to editor
vim.keymap.set("n", "<leader>ts", function()
  vscode.action("workbench.action.toggleSidebarVisibility")
end, { desc = "Toggle Sidebar" })

vim.keymap.set("n", "<leader>tt", function()
  vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Toggle Terminal" })

vim.keymap.set("n", "<leader>tc", function()
  vscode.action("workbench.action.chat.toggle")
end, { desc = "Toggle Chat" })

-- Focus specific panels directly
vim.keymap.set("n", "<leader>fs", function()
  vscode.action("workbench.view.explorer")
end, { desc = "Focus File Explorer" })

vim.keymap.set("n", "<leader>fg", function()
  vscode.action("workbench.view.scm")
end, { desc = "Focus Git Panel" })

vim.keymap.set("n", "<leader>fd", function()
  vscode.action("workbench.view.debug")
end, { desc = "Focus Debug Panel" })

vim.keymap.set("n", "<leader>fx", function()
  vscode.action("workbench.view.extensions")
end, { desc = "Focus Extensions Panel" })

-- Smart layout manipulation
vim.keymap.set("n", "<leader>ws", function()
  vscode.action("workbench.action.splitEditorDown")
end, { desc = "Split Window Below" })

vim.keymap.set("n", "<leader>wv", function()
  vscode.action("workbench.action.splitEditorRight")
end, { desc = "Split Window Right" })

vim.keymap.set("n", "<leader>wo", function()
  vscode.action("workbench.action.joinTwoGroups")
end, { desc = "Close Other Windows" })

-- Quick jump to first/last editor group
vim.keymap.set("n", "<leader>w1", function()
  vscode.action("workbench.action.openEditorAtIndex1")
end, { desc = "Go to Editor Group 1" })

vim.keymap.set("n", "<leader>w2", function()
  vscode.action("workbench.action.openEditorAtIndex2")
end, { desc = "Go to Editor Group 2" })

vim.keymap.set("n", "<leader>w3", function()
  vscode.action("workbench.action.openEditorAtIndex3")
end, { desc = "Go to Editor Group 3" })

-- Terminal navigation enhancements
vim.keymap.set("n", "<leader>tn", function()
  vscode.action("workbench.action.terminal.new")
end, { desc = "New Terminal" })

vim.keymap.set("n", "<leader>tk", function()
  vscode.action("workbench.action.terminal.kill")
end, { desc = "Kill Terminal" })

vim.keymap.set("n", "<leader>tr", function()
  vscode.action("workbench.action.terminal.rename")
end, { desc = "Rename Terminal" })

-- Panel size adjustments (matching your Alt+Arrow setup)
vim.keymap.set("n", "<leader>w+", function()
  vscode.action("workbench.action.increaseViewHeight")
end, { desc = "Increase Window Height" })

vim.keymap.set("n", "<leader>w-", function()
  vscode.action("workbench.action.decreaseViewHeight")
end, { desc = "Decrease Window Height" })

vim.keymap.set("n", "<leader>w>", function()
  vscode.action("workbench.action.increaseViewWidth")
end, { desc = "Increase Window Width" })

vim.keymap.set("n", "<leader>w<", function()
  vscode.action("workbench.action.decreaseViewWidth")
end, { desc = "Decrease Window Width" })

-- ===================================================================
-- SMART NAVIGATION SYSTEM EXPLANATION
-- ===================================================================
--[[
SMART CTRL+ARROW NAVIGATION:

This system provides context-aware navigation similar to smart-splits in Neovim.
The logic is handled in VSCode keybindings.json and works as follows:

• Ctrl+Left:
  - From editor → Focus sidebar (if leftmost group)
  - From terminal/chat → Focus active editor group
  - From sidebar → Stay in sidebar (no action)

• Ctrl+Right:
  - From editor → Open/focus chat (if rightmost group)
  - From sidebar/terminal → Focus active editor group
  - From chat → Stay in chat (no action)

• Ctrl+Down:
  - From any context → Focus terminal
  - From terminal → Focus next terminal pane

• Ctrl+Up:
  - From terminal → Focus active editor group
  - From other contexts → Pass through to Neovim for editor navigation

The system uses VSCode's "when" clauses to detect context:
- editorTextFocus: When in an editor
- terminalFocus: When in terminal
- sideBarFocus: When sidebar is focused
- inChat: When in Copilot Chat

FALLBACK KEYMAPS:
The Neovim keymaps below provide fallback behavior and additional
navigation helpers when the smart system doesn't apply.
--]]

-- Quick panel access (matching VSCode Ctrl+Alt+Number shortcuts)
vim.keymap.set("n", "<leader>p1", function()
  vscode.action("workbench.view.explorer")
end, { desc = "Panel: Explorer" })

vim.keymap.set("n", "<leader>p2", function()
  vscode.action("workbench.view.search")
end, { desc = "Panel: Search" })

vim.keymap.set("n", "<leader>p3", function()
  vscode.action("workbench.view.scm")
end, { desc = "Panel: Git" })

vim.keymap.set("n", "<leader>p4", function()
  vscode.action("workbench.view.debug")
end, { desc = "Panel: Debug" })

vim.keymap.set("n", "<leader>p5", function()
  vscode.action("workbench.view.extensions")
end, { desc = "Panel: Extensions" })

-- Universal return to editor (matching Ctrl+0)
vim.keymap.set("n", "<leader>0", function()
  vscode.action("workbench.action.focusActiveEditorGroup")
end, { desc = "Focus Editor Group" })
