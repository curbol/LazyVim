if not vim.g.vscode then
  return
end

-- Set up leader key properly for VSCode
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- VSCode-specific options for better integration
local opt = vim.opt

-- Disable some features that conflict with VSCode
opt.laststatus = 0 -- VSCode handles the status line
opt.showmode = false -- VSCode shows the mode
opt.ruler = false -- VSCode shows cursor position
opt.showcmd = false -- VSCode shows commands
opt.cmdheight = 1 -- Minimal command height since VSCode handles most UI

-- Keep essential vim options that work well with VSCode
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Scrolling behavior
opt.scrolloff = 10
opt.sidescrolloff = 8

-- Better splits
opt.splitbelow = true
opt.splitright = true

-- Use VSCode's clipboard integration
if vim.g.vscode_clipboard then
  vim.g.clipboard = vim.g.vscode_clipboard
end

-- Disable swap files and backup files as VSCode handles file management
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Faster update time for better VSCode integration
opt.updatetime = 250

-- Set notification function to use VSCode notifications
vim.notify = require("vscode").notify
