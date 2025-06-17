-- VSCode-specific autocmds
if not vim.g.vscode then
  return
end

local function augroup(name)
  return vim.api.nvim_create_augroup("vscode_" .. name, { clear = true })
end

-- Disable some autocmds that don't work well with VSCode
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  group = augroup("disable_autocmds"),
  callback = function()
    -- Clear some LazyVim autocmds that might interfere with VSCode
    pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_highlight_yank")
    pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_resize_splits")
    pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_close_with_q")
  end,
})

-- Use VSCode's notification system
vim.notify = require("vscode").notify
