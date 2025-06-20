if not vim.g.vscode then
  return
end

-- Set leader key explicitly for VSCode
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- VSCode-specific options for better integration
local opt = vim.opt

-- ===================================================================
-- DISPLAY & VISUAL SETTINGS
-- ===================================================================
-- Disable these as VSCode handles them
opt.number = false          -- VSCode handles line numbers
opt.relativenumber = false  -- VSCode handles relative line numbers
opt.signcolumn = "no"       -- VSCode handles sign column
opt.foldcolumn = "0"        -- VSCode handles fold column
opt.colorcolumn = ""        -- VSCode handles color column
opt.laststatus = 0          -- No status line needed (VSCode handles it)
opt.showtabline = 0         -- No tab line needed (VSCode handles it)
opt.cmdheight = 1           -- Keep minimal command height
opt.showmode = false        -- Don't show mode (VSCode shows it)
opt.ruler = false           -- VSCode shows cursor position
opt.showcmd = false         -- VSCode shows pending commands

-- ===================================================================
-- SCROLLING & CURSOR BEHAVIOR
-- ===================================================================
-- VSCode handles scrolling, but these still affect nvim behavior
opt.scrolloff = 10            -- Keep some context when scrolling
opt.sidescrolloff = 8       -- Keep some context when side scrolling
opt.cursorline = false      -- VSCode handles cursor line highlighting

-- ===================================================================
-- COMPLETION & SUGGESTIONS
-- ===================================================================
-- Disable nvim's completion since VSCode handles it
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10          -- Limit popup menu height

-- ===================================================================
-- SEARCH BEHAVIOR
-- ===================================================================
opt.hlsearch = true         -- Highlight search results
opt.incsearch = true        -- Show search results as you type
opt.ignorecase = true       -- Case insensitive search
opt.smartcase = true        -- Case sensitive if uppercase present

-- ===================================================================
-- EDITING BEHAVIOR
-- ===================================================================
opt.autoindent = true       -- Auto indent new lines
opt.smartindent = true      -- Smart indenting for code
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Indent with 2 spaces
opt.tabstop = 2             -- Tab equals 2 spaces
opt.softtabstop = 2         -- Soft tab equals 2 spaces
opt.wrap = false            -- Don't wrap lines (VSCode handles this)

-- ===================================================================
-- BACKUP & SWAP FILES
-- ===================================================================
-- Let VSCode handle file management
opt.backup = false          -- Don't create backup files
opt.writebackup = false     -- Don't create backup before writing
opt.swapfile = false        -- Don't create swap files
opt.undofile = false        -- Don't create undo files (VSCode handles undo)

-- ===================================================================
-- CLIPBOARD INTEGRATION
-- ===================================================================
-- Use VSCode's clipboard
if vim.g.vscode_clipboard then
  vim.g.clipboard = vim.g.vscode_clipboard
end

-- ===================================================================
-- TIMEOUT SETTINGS
-- ===================================================================
opt.timeout = true
opt.timeoutlen = 300        -- Wait 300ms for mapped sequence
opt.ttimeoutlen = 50        -- Wait 50ms for key codes

-- ===================================================================
-- MOUSE & SELECTION
-- ===================================================================
opt.mouse = "a"             -- Enable mouse support
opt.selection = "exclusive" -- Exclusive selection mode

-- ===================================================================
-- WINDOW & BUFFER BEHAVIOR
-- ===================================================================
opt.hidden = true           -- Allow hidden buffers
opt.splitbelow = true       -- Split below current window
opt.splitright = true       -- Split to the right of current window

-- ===================================================================
-- PERFORMANCE OPTIMIZATIONS
-- ===================================================================
opt.updatetime = 250        -- Faster completion (4000ms default)
opt.redrawtime = 1500       -- Time to wait for redraw
opt.synmaxcol = 200         -- Only syntax highlight first 200 columns
opt.lazyredraw = false      -- Don't use lazy redraw (can cause issues with VSCode)

-- ===================================================================
-- MISC SETTINGS
-- ===================================================================
opt.virtualedit = "block"   -- Allow virtual editing in visual block mode
opt.backspace = { "indent", "eol", "start" } -- Allow backspace over everything
opt.whichwrap:append("<,>,[,],h,l") -- Allow cursor to wrap lines

-- ===================================================================
-- DISABLE PROBLEMATIC FEATURES
-- ===================================================================
-- Disable features that conflict with VSCode
opt.termguicolors = false   -- Let VSCode handle colors
opt.background = "dark"     -- Set to match VSCode theme preference
