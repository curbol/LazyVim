-- Comprehensive VSCode integration for LazyVim
-- This file combines all VSCode-specific configurations and enhancements

if not vim.g.vscode then
  return {}
end

local vscode = require("vscode")

-- ===================================================================
-- UTILITY FUNCTIONS
-- ===================================================================

-- Helper function to check if we're in VSCode
_G.in_vscode = function()
  return vim.g.vscode ~= nil
end

-- Helper function to execute VSCode action with error handling
_G.vscode_action = function(action, opts)
  opts = opts or {}
  local ok, err = pcall(vscode.action, action, opts)
  if not ok then
    vim.notify("VSCode action failed: " .. action .. " - " .. tostring(err), vim.log.levels.WARN)
  end
end

-- Helper function to execute VSCode action with fallback
_G.vscode_action_fallback = function(action, fallback_fn, opts)
  opts = opts or {}
  local ok, err = pcall(vscode.action, action, opts)
  if not ok and fallback_fn then
    fallback_fn()
  end
end

return {
  -- ===================================================================
  -- LAZYVIM CORE OVERRIDES
  -- ===================================================================
  {
    "LazyVim/LazyVim",
    opts = function()
      -- Override LazyVim's terminal function for VSCode
      function LazyVim.terminal()
        vscode.action("workbench.action.terminal.toggleTerminal")
      end

      -- Override LazyVim's format function for VSCode
      function LazyVim.format(opts)
        opts = opts or {}
        if opts.range then
          vscode.action("editor.action.formatSelection")
        else
          vscode.action("editor.action.formatDocument")
        end
      end

      return {}
    end,
  },

  -- ===================================================================
  -- PLUGIN CONFIGURATIONS
  -- ===================================================================

  -- Enhanced mini.move configuration for VSCode
  {
    "echasnovski/mini.move",
    opts = {
      mappings = {
        -- Move visual selection in Visual mode
        left = "<A-Left>",
        right = "<A-Right>",
        down = "<A-Down>",
        up = "<A-Up>",

        -- Move current line in Normal mode
        line_left = "<A-Left>",
        line_right = "<A-Right>",
        line_down = "<A-Down>",
        line_up = "<A-Up>",
      },
    },
  },

  -- Enhanced flash.nvim for VSCode
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = true,
          highlight = { backdrop = false },
        },
        char = {
          enabled = false, -- Disable f/F/t/T motions in VSCode
        },
      },
    },
  },

  -- Enhanced yanky.nvim for VSCode clipboard integration
  {
    "gbprod/yanky.nvim",
    opts = {
      ring = {
        history_length = 100,
        storage = "memory", -- Use memory storage in VSCode
      },
      picker = {
        select = {
          action = nil, -- Disable telescope picker in VSCode
        },
      },
      system_clipboard = {
        sync_with_ring = true,
      },
    },
  },

  -- Configure dial.nvim for VSCode
  {
    "monaqa/dial.nvim",
    opts = function()
      local augend = require("dial.augend")
      return {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      }
    end,
  },

  -- Enhanced treesitter for VSCode (disable conflicting features)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = false }, -- Let VSCode handle syntax highlighting
      indent = { enable = false }, -- Let VSCode handle indentation
      incremental_selection = {
        enable = true, -- Keep incremental selection
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },

  -- Configure mini.ai for better text objects in VSCode
  {
    "echasnovski/mini.ai",
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      }
    end,
  },

  -- Enhanced mini.surround for VSCode
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },

  -- Configure mini.comment for VSCode
  {
    "echasnovski/mini.comment",
    opts = {
      options = {
        custom_commentstring = function()
          -- Let VSCode handle comment strings
          return vim.bo.commentstring
        end,
      },
    },
  },

  -- VSCode-specific which-key configuration
  {
    "folke/which-key.nvim",
    opts = {
      -- VSCode-specific which-key configuration
      preset = "modern",
      delay = function(ctx)
        return ctx.plugin and 0 or 200
      end,
      spec = {
        -- Leader key groups
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui" },
        { "<leader>w", group = "windows" },
        { "<leader>x", group = "diagnostics/quickfix" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>d", group = "debug" },
        { "<leader>r", group = "refactor" },
        { "<leader>n", group = "notifications" },
        { "<leader>m", group = "bookmarks" },
        { "<leader>t", group = "test/tasks" },
        
        -- Git groups
        { "<leader>gb", desc = "Git Blame Line" },
        { "<leader>gc", desc = "Git Commit" },
        { "<leader>gf", desc = "Git Fetch" },
        { "<leader>gg", desc = "Git Status" },
        { "<leader>gp", desc = "Git Pull" },
        { "<leader>gP", desc = "Git Push" },
        
        -- Code groups
        { "<leader>ca", desc = "Code Action" },
        { "<leader>cf", desc = "Format" },
        { "<leader>cp", desc = "Command Palette" },
        { "<leader>cr", desc = "Rename" },
        { "<leader>cd", desc = "Line Diagnostics" },
        
        -- File groups
        { "<leader>ff", desc = "Find Files" },
        { "<leader>fn", desc = "New File" },
        { "<leader>fr", desc = "Recent Files" },
        { "<leader>ft", desc = "Terminal" },
        { "<leader>fT", desc = "Terminal (cwd)" },
        { "<leader>fp", desc = "Recent Projects" },
        
        -- Search groups
        { "<leader>sg", desc = "Grep" },
        { "<leader>sk", desc = "Keymaps" },
        { "<leader>sr", desc = "Search and Replace" },
        { "<leader>ss", desc = "Goto Symbol" },
        { "<leader>sc", desc = "Commands" },
        
        -- UI groups
        { "<leader>uf", desc = "Toggle Sidebar" },
        { "<leader>un", desc = "Dismiss Notifications" },
        { "<leader>uw", desc = "Toggle Wrap" },
        { "<leader>uz", desc = "Toggle Zen Mode" },
        
        -- Buffer groups
        { "<leader>bb", desc = "Switch Buffer" },
        { "<leader>bd", desc = "Delete Buffer" },
        { "<leader>bo", desc = "Delete Other Buffers" },
        
        -- Window groups
        { "<leader>wd", desc = "Delete Window" },
        { "<leader>-", desc = "Split Below" },
        { "<leader>|", desc = "Split Right" },
        
        -- Diagnostic groups
        { "<leader>xl", desc = "Location List" },
        { "<leader>xq", desc = "Quickfix List" },
        
        -- Debug groups
        { "<leader>db", desc = "Toggle Breakpoint" },
        { "<leader>dc", desc = "Continue" },
        { "<leader>ds", desc = "Start" },
        { "<leader>dt", desc = "Stop" },
        
        -- Tab groups
        { "<leader><tab><tab>", desc = "New Tab" },
        { "<leader><tab>d", desc = "Close Tab" },
        { "<leader><tab>]", desc = "Next Tab" },
        { "<leader><tab>[", desc = "Previous Tab" },
        
        -- Bookmark groups (if bookmarks extension is installed)
        { "<leader>mm", desc = "Toggle Bookmark" },
        { "<leader>ml", desc = "List Bookmarks" },
        
        -- Notification groups
        { "<leader>nc", desc = "Clear Notifications" },
        { "<leader>nf", desc = "Focus Notifications" },
        
        -- Global mappings
        { "gd", desc = "Goto Definition" },
        { "gr", desc = "References" },
        { "gI", desc = "Goto Implementation" },
        { "gy", desc = "Goto Type Definition" },
        { "gD", desc = "Goto Declaration" },
        { "gp", desc = "Peek Definition" },
        { "gP", desc = "Peek Declaration" },
        { "K", desc = "Hover" },
        { "gK", desc = "Signature Help" },
        
        -- Navigation
        { "]d", desc = "Next Diagnostic" },
        { "[d", desc = "Prev Diagnostic" },
        { "]e", desc = "Next Error" },
        { "[e", desc = "Prev Error" },
        { "]w", desc = "Next Warning" },
        { "[w", desc = "Prev Warning" },
        { "]q", desc = "Next Quickfix" },
        { "[q", desc = "Previous Quickfix" },
        { "]b", desc = "Next Buffer" },
        { "[b", desc = "Prev Buffer" },
        
        -- Fold operations
        { "za", desc = "Toggle Fold" },
        { "zA", desc = "Toggle Fold Recursively" },
        { "zc", desc = "Close Fold" },
        { "zo", desc = "Open Fold" },
        { "zM", desc = "Close All Folds" },
        { "zR", desc = "Open All Folds" },
        { "zj", desc = "Next Fold" },
        { "zk", desc = "Previous Fold" },
        
        -- Window navigation
        { "<C-Left>", desc = "Go to Left Window" },
        { "<C-Down>", desc = "Go to Lower Window" },
        { "<C-Up>", desc = "Go to Upper Window" },
        { "<C-Right>", desc = "Go to Right Window" },
        
        -- Buffer navigation
        { "<S-Left>", desc = "Prev Buffer" },
        { "<S-Right>", desc = "Next Buffer" },
        
        -- Multi-cursor
        { "<C-d>", desc = "Add Selection to Next Find Match" },
        { "<C-S-d>", desc = "Select All Occurrences" },
        
        -- Terminal
        { "<c-/>", desc = "Toggle Terminal" },
        
        -- Other useful mappings
        { "<leader>qq", desc = "Quit All" },
        { "<leader>e", desc = "Explorer" },
        { "<leader>/", desc = "Grep" },
        { "<leader><space>", desc = "Find Files" },
        { "<leader>`", desc = "Switch to Other Buffer" },
        { "<leader>.", desc = "Quick Fix" },
        { "<leader>z", desc = "Toggle Zen Mode" },
        { "<leader>r", desc = "Refactor" },
      },
    },
  },

  -- ===================================================================
  -- VSCODE INTEGRATION AND UTILITIES
  -- ===================================================================
  {
    "folke/lazy.nvim",
    opts = function()
      -- Set up VSCode integration when LazyVim starts
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          -- Disable some LazyVim features that don't make sense in VSCode
          vim.g.lazyvim_picker = "none" -- Disable LazyVim's picker
          
          -- Set up VSCode-specific settings
          vim.opt.clipboard = "unnamedplus" -- Use system clipboard
          vim.opt.mouse = "a" -- Enable mouse support
          
          -- ===================================================================
          -- CUSTOM USER COMMANDS
          -- ===================================================================
          
          -- Create custom commands for VSCode integration
          vim.api.nvim_create_user_command("Format", function()
            vscode.action("editor.action.formatDocument")
          end, { desc = "Format document" })
          
          vim.api.nvim_create_user_command("OrganizeImports", function()
            vscode.action("editor.action.organizeImports")
          end, { desc = "Organize imports" })
          
          vim.api.nvim_create_user_command("Rename", function()
            vscode.action("editor.action.rename")
          end, { desc = "Rename symbol" })
          
          vim.api.nvim_create_user_command("GoToDefinition", function()
            vscode.action("editor.action.revealDefinition")
          end, { desc = "Go to definition" })
          
          vim.api.nvim_create_user_command("ShowReferences", function()
            vscode.action("editor.action.goToReferences")
          end, { desc = "Show references" })
          
          vim.api.nvim_create_user_command("QuickFix", function()
            vscode.action("editor.action.quickFix")
          end, { desc = "Quick fix" })
          
          vim.api.nvim_create_user_command("CommandPalette", function()
            vscode.action("workbench.action.showCommands")
          end, { desc = "Command palette" })
          
          vim.api.nvim_create_user_command("Explorer", function()
            vscode.action("workbench.view.explorer")
          end, { desc = "File explorer" })
          
          vim.api.nvim_create_user_command("GitStatus", function()
            vscode.action("workbench.view.scm")
          end, { desc = "Git status" })
          
          vim.api.nvim_create_user_command("Terminal", function()
            vscode.action("workbench.action.terminal.toggleTerminal")
          end, { desc = "Toggle terminal" })
          
          vim.api.nvim_create_user_command("Problems", function()
            vscode.action("workbench.actions.view.problems")
          end, { desc = "Problems panel" })
          
          vim.api.nvim_create_user_command("ZenMode", function()
            vscode.action("workbench.action.toggleZenMode")
          end, { desc = "Toggle zen mode" })
          
          -- Command to reload VSCode window (useful for config changes)
          vim.api.nvim_create_user_command("VSCodeReload", function()
            vscode.action("workbench.action.reloadWindow")
          end, { desc = "Reload VSCode window" })
          
          -- Command to open VSCode settings
          vim.api.nvim_create_user_command("VSCodeSettings", function()
            vscode.action("workbench.action.openSettings")
          end, { desc = "Open VSCode settings" })
          
          -- Command to open keybindings
          vim.api.nvim_create_user_command("VSCodeKeybindings", function()
            vscode.action("workbench.action.openGlobalKeybindings")
          end, { desc = "Open VSCode keybindings" })
          
          -- Command to show installed extensions
          vim.api.nvim_create_user_command("VSCodeExtensions", function()
            vscode.action("workbench.view.extensions")
          end, { desc = "Show VSCode extensions" })
          
          -- Command to open command palette
          vim.api.nvim_create_user_command("VSCodeCommands", function()
            vscode.action("workbench.action.showCommands")
          end, { desc = "Open command palette" })
          
          print("LazyVim + VSCode integration loaded! 🚀")
        end,
      })

      -- Set up additional VSCode keymaps that complement LazyVim
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimKeymapsDefaults",
        callback = function()
          -- ===================================================================
          -- CORE KEYMAPS
          -- ===================================================================
          
          -- Multi-cursor support using VSCode's native functionality
          vim.keymap.set({ "n", "x" }, "<C-d>", function()
            vscode.with_insert(function()
              vscode.action("editor.action.addSelectionToNextFindMatch")
            end)
          end, { desc = "Add selection to next find match" })
          
          vim.keymap.set({ "n", "x" }, "<C-S-d>", function()
            vscode.action("editor.action.selectHighlights")
          end, { desc = "Select all occurrences" })
          
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
          end, { desc = "Comment line" })
          
          vim.keymap.set("n", "gco", function()
            vscode.action("editor.action.insertCursorAtEndOfEachLineSelected")
            vscode.action("editor.action.commentLine")
          end, { desc = "Comment below" })
          
          vim.keymap.set("n", "gcO", function()
            vscode.action("editor.action.insertCursorAtEndOfEachLineSelected")
            vscode.action("editor.action.commentLine")
          end, { desc = "Comment above" })
          
          -- ===================================================================
          -- DIAGNOSTIC NAVIGATION
          -- ===================================================================
          
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
          
          -- ===================================================================
          -- QUICKFIX NAVIGATION
          -- ===================================================================
          
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
          
          -- ===================================================================
          -- ADDITIONAL USEFUL MAPPINGS
          -- ===================================================================
          
          vim.keymap.set("n", "<leader>cp", function()
            vscode.action("workbench.action.showCommands")
          end, { desc = "Command Palette" })
          
          vim.keymap.set("n", "<leader>.", function()
            vscode.action("editor.action.quickFix")
          end, { desc = "Quick Fix" })
          
          -- ===================================================================
          -- FOLD OPERATIONS
          -- ===================================================================
          
          vim.keymap.set("n", "za", function()
            vscode.action("editor.toggleFold")
          end, { desc = "Toggle fold" })
          
          vim.keymap.set("n", "zA", function()
            vscode.action("editor.toggleFoldRecursively")
          end, { desc = "Toggle fold recursively" })
          
          vim.keymap.set("n", "zc", function()
            vscode.action("editor.fold")
          end, { desc = "Close fold" })
          
          vim.keymap.set("n", "zo", function()
            vscode.action("editor.unfold")
          end, { desc = "Open fold" })
          
          vim.keymap.set("n", "zM", function()
            vscode.action("editor.foldAll")
          end, { desc = "Close all folds" })
          
          vim.keymap.set("n", "zR", function()
            vscode.action("editor.unfoldAll")
          end, { desc = "Open all folds" })
          
          vim.keymap.set("n", "zj", function()
            vscode.action("editor.gotoNextFold")
          end, { desc = "Next fold" })
          
          vim.keymap.set("n", "zk", function()
            vscode.action("editor.gotoPreviousFold")
          end, { desc = "Previous fold" })
          
          -- ===================================================================
          -- SEARCH AND REPLACE
          -- ===================================================================
          
          vim.keymap.set("n", "<leader>sr", function()
            vscode.action("workbench.action.replaceInFiles")
          end, { desc = "Search and Replace" })
          
          -- ===================================================================
          -- BOOKMARKS (if bookmarks extension is installed)
          -- ===================================================================
          
          vim.keymap.set("n", "<leader>mm", function()
            vscode_action("bookmarks.toggle", {
              callback = function()
                vim.notify("Bookmark toggled", vim.log.levels.INFO)
              end
            })
          end, { desc = "Toggle Bookmark" })
          
          vim.keymap.set("n", "<leader>ml", function()
            vscode_action("bookmarks.list")
          end, { desc = "List Bookmarks" })
          
          -- ===================================================================
          -- ZEN MODE AND UI TOGGLES
          -- ===================================================================
          
          vim.keymap.set("n", "<leader>z", function()
            vscode.action("workbench.action.toggleZenMode")
          end, { desc = "Toggle Zen Mode" })
          
          vim.keymap.set("n", "<leader>uf", function()
            vscode.action("workbench.action.toggleSidebarVisibility")
          end, { desc = "Toggle Sidebar" })
          
          -- ===================================================================
          -- TERMINAL INTEGRATION
          -- ===================================================================
          
          vim.keymap.set("n", "<leader>fT", function()
            vscode.action("workbench.action.terminal.newInActiveWorkspace")
          end, { desc = "Terminal (cwd)" })
          
          -- ===================================================================
          -- GIT INTEGRATION
          -- ===================================================================
          
          vim.keymap.set("n", "<leader>gf", function()
            vscode.action("git.fetch")
          end, { desc = "Git fetch" })
          
          vim.keymap.set("n", "<leader>gp", function()
            vscode.action("git.pull")
          end, { desc = "Git pull" })
          
          vim.keymap.set("n", "<leader>gP", function()
            vscode.action("git.push")
          end, { desc = "Git push" })
          
          vim.keymap.set("n", "<leader>gc", function()
            vscode.action("git.commit")
          end, { desc = "Git commit" })
          
          -- ===================================================================
          -- WORKSPACE AND PROJECT MANAGEMENT
          -- ===================================================================
          
          vim.keymap.set("n", "<leader>ws", function()
            vscode.action("workbench.action.files.saveWorkspaceAs")
          end, { desc = "Save Workspace" })
          
          vim.keymap.set("n", "<leader>wo", function()
            vscode.action("workbench.action.openWorkspace")
          end, { desc = "Open Workspace" })
          
          vim.keymap.set("n", "<leader>fp", function()
            vscode.action("workbench.action.openRecent")
          end, { desc = "Recent Projects" })
          
          -- ===================================================================
          -- DEBUGGING SUPPORT (if debugging extensions are installed)
          -- ===================================================================
          
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
          
          -- ===================================================================
          -- TASK RUNNING
          -- ===================================================================
          
          vim.keymap.set("n", "<leader>tr", function()
            vscode.action("workbench.action.tasks.runTask")
          end, { desc = "Run Task" })
          
          -- ===================================================================
          -- NOTIFICATION MANAGEMENT
          -- ===================================================================
          
          vim.keymap.set("n", "<leader>nc", function()
            vscode.action("notifications.clearAll")
          end, { desc = "Clear Notifications" })
          
          vim.keymap.set("n", "<leader>nf", function()
            vscode.action("notifications.focusToasts")
          end, { desc = "Focus Notifications" })
        end,
      })
    end,
  },
}
