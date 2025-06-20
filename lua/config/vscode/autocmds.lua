if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- ===================================================================
-- VSCODE-SPECIFIC AUTOCMDS
-- ===================================================================

-- Create an augroup for VSCode-specific autocmds
local vscode_group = vim.api.nvim_create_augroup("VSCodeIntegration", { clear = true })

-- Sync cursor position with VSCode
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  group = vscode_group,
  callback = function()
    -- This helps keep VSCode and Neovim cursor in sync
    -- The extension handles most of this, but this ensures consistency
  end,
})

-- Handle buffer operations
vim.api.nvim_create_autocmd("BufEnter", {
  group = vscode_group,
  callback = function()
    -- Ensure proper buffer state when entering buffers in VSCode
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

-- Handle file type specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = vscode_group,
  pattern = { "json", "jsonc" },
  callback = function()
    -- Set up JSON-specific settings that work well with VSCode
    vim.opt_local.conceallevel = 0
  end,
})

-- Improve clipboard integration
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = vscode_group,
  callback = function()
    -- Ensure yanked text is available in VSCode clipboard
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Handle search highlighting
vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = vscode_group,
  pattern = { "/", "?" },
  callback = function()
    vim.opt.hlsearch = true
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = vscode_group,
  pattern = { "/", "?" },
  callback = function()
    vim.defer_fn(function()
      vim.cmd("nohlsearch")
    end, 500)
  end,
})

-- Handle insert mode improvements
vim.api.nvim_create_autocmd("InsertEnter", {
  group = vscode_group,
  callback = function()
    -- Ensure proper insert mode behavior
    vim.opt.timeoutlen = 300
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = vscode_group,
  callback = function()
    -- Reset timeout when leaving insert mode
    vim.opt.timeoutlen = 300
  end,
})

-- Handle window focus events
vim.api.nvim_create_autocmd("WinEnter", {
  group = vscode_group,
  callback = function()
    -- Ensure consistent behavior when focusing windows
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert")
    end
  end,
})

-- Improve terminal integration
vim.api.nvim_create_autocmd("TermOpen", {
  group = vscode_group,
  callback = function()
    -- Set up terminal buffer properly
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
  end,
})

-- Handle quickfix and location list
vim.api.nvim_create_autocmd("FileType", {
  group = vscode_group,
  pattern = { "qf" },
  callback = function()
    -- Quickfix buffer settings that work well with VSCode
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.buflisted = false
  end,
})
