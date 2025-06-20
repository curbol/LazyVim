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

-- ===================================================================
-- COPILOT CHAT MAPPINGS (matching LazyVim)
-- ===================================================================
-- Chat Management:
--   <leader>aa - Toggle Chat
--   <leader>ai - Open Chat
--   <leader>ap - Open in Sidebar
--   <leader>aq - Close Chat
--   <leader>aQ - Quick Chat (toggle)
--   <leader>ax - Clear Chat
-- Code Actions:
--   <leader>ac - Explain Code
--   <leader>ad - Generate Docs
--   <leader>af - Add File to Context
--   <leader>aF - Fix Code
--   <leader>ag - Generate Code
--   <leader>ao - Optimize Code
--   <leader>ar - Refactor Code
--   <leader>as - Send to Inline Chat
--   <leader>at - Generate Tests
-- ===================================================================

-- AI/Copilot Chat operations under <leader>a
vim.keymap.set({ "n", "v" }, "<leader>a", "+ai", { desc = "+ai" })

vim.keymap.set({ "n", "v" }, "<leader>aa", function()
  vscode.action("workbench.action.chat.toggle")
end, { desc = "Toggle Chat (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>ac", function()
  vscode.action("github.copilot.interactiveEditor.explain")
end, { desc = "Explain Code (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>ad", function()
  vscode.action("github.copilot.interactiveEditor.generateDocs")
end, { desc = "Generate Docs (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>aF", function()
  vscode.action("github.copilot.interactiveEditor.fix")
end, { desc = "Fix Code (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>ag", function()
  vscode.action("github.copilot.generate")
end, { desc = "Generate Code (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>ai", function()
  vscode.action("workbench.action.chat.open")
end, { desc = "Open Chat (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>ao", function()
  vscode.action("github.copilot.interactiveEditor.optimize")
end, { desc = "Optimize Code (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>ar", function()
  vscode.action("github.copilot.interactiveEditor.refactor")
end, { desc = "Refactor Code (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>as", function()
  vscode.action("github.copilot.sendChatToInlineChat")
end, { desc = "Send to Inline Chat (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>at", function()
  vscode.action("github.copilot.interactiveEditor.generateTests")
end, { desc = "Generate Tests (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>ax", function()
  vscode.action("workbench.action.chat.clear")
end, { desc = "Clear Chat (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>aq", function()
  vscode.action("workbench.action.quickchat.toggle")
end, { desc = "Quick Chat (CopilotChat)" })

vim.keymap.set({ "n", "v" }, "<leader>af", function()
  vscode.action("github.copilot.chat.attachFile")
end, { desc = "Add File to Context (CopilotChat)" })

-- ===================================================================
-- ADDITIONAL MAPPINGS FROM PLUGIN FILE
-- ===================================================================

-- Multi-cursor support using VSCode's native functionality
vim.keymap.set({ "n", "x" }, "<C-d>", function()
  vscode.with_insert(function()
    vscode.action("editor.action.addSelectionToNextFindMatch")
  end)
end, { desc = "Add Selection to Next Find Match" })

vim.keymap.set({ "n", "x" }, "<C-S-d>", function()
  vscode.action("editor.action.selectHighlights")
end, { desc = "Select All Occurrences" })

-- Better refactoring support
vim.keymap.set({ "n", "x" }, "<leader>r", function()
  vscode.with_insert(function()
    vscode.action("editor.action.refactor")
  end)
end, { desc = "Refactor" })

-- Peek operations (LazyVim-style)
vim.keymap.set("n", "gp", function()
  vscode.action("editor.action.peekDefinition")
end, { desc = "Peek Definition" })

vim.keymap.set("n", "gP", function()
  vscode.action("editor.action.peekDeclaration")
end, { desc = "Peek Declaration" })

-- Comment mappings (using VSCode's comment functionality)
vim.keymap.set({ "n", "v" }, "gc", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Comment" })

vim.keymap.set("n", "gcc", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Comment Line" })

vim.keymap.set("n", "gco", function()
  vscode.action("editor.action.insertCursorAtEndOfEachLineSelected")
  vscode.action("editor.action.commentLine")
end, { desc = "Comment Below" })

vim.keymap.set("n", "gcO", function()
  vscode.action("editor.action.insertCursorAtEndOfEachLineSelected")
  vscode.action("editor.action.commentLine")
end, { desc = "Comment Above" })

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

-- Fold operations
vim.keymap.set("n", "za", function()
  vscode.action("editor.toggleFold")
end, { desc = "Toggle Fold" })

vim.keymap.set("n", "zA", function()
  vscode.action("editor.toggleFoldRecursively")
end, { desc = "Toggle Fold Recursively" })

vim.keymap.set("n", "zc", function()
  vscode.action("editor.fold")
end, { desc = "Close Fold" })

vim.keymap.set("n", "zo", function()
  vscode.action("editor.unfold")
end, { desc = "Open Fold" })

vim.keymap.set("n", "zM", function()
  vscode.action("editor.foldAll")
end, { desc = "Close All Folds" })

vim.keymap.set("n", "zR", function()
  vscode.action("editor.unfoldAll")
end, { desc = "Open All Folds" })

vim.keymap.set("n", "zj", function()
  vscode.action("editor.gotoNextFold")
end, { desc = "Next Fold" })

vim.keymap.set("n", "zk", function()
  vscode.action("editor.gotoPreviousFold")
end, { desc = "Previous Fold" })

-- Search and replace
vim.keymap.set("n", "<leader>sr", function()
  vscode.action("workbench.action.replaceInFiles")
end, { desc = "Search and Replace" })

-- Zen mode and UI toggles
vim.keymap.set("n", "<leader>z", function()
  vscode.action("workbench.action.toggleZenMode")
end, { desc = "Toggle Zen Mode" })

-- Terminal integration
vim.keymap.set("n", "<leader>fT", function()
  vscode.action("workbench.action.terminal.newInActiveWorkspace")
end, { desc = "Terminal (cwd)" })

-- Git integration
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

-- Workspace and project management
vim.keymap.set("n", "<leader>ws", function()
  vscode.action("workbench.action.files.saveWorkspaceAs")
end, { desc = "Save Workspace" })

vim.keymap.set("n", "<leader>wo", function()
  vscode.action("workbench.action.openWorkspace")
end, { desc = "Open Workspace" })

vim.keymap.set("n", "<leader>fp", function()
  vscode.action("workbench.action.openRecent")
end, { desc = "Recent Projects" })

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

-- Task running
vim.keymap.set("n", "<leader>tr", function()
  vscode.action("workbench.action.tasks.runTask")
end, { desc = "Run Task" })

-- Notification management
vim.keymap.set("n", "<leader>nc", function()
  vscode.action("notifications.clearAll")
end, { desc = "Clear Notifications" })

vim.keymap.set("n", "<leader>nf", function()
  vscode.action("notifications.focusToasts")
end, { desc = "Focus Notifications" })

-- ===================================================================
