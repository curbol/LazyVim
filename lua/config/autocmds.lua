-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable New Line Comment",
})

-- Clear caches when git branch changes
local function check_branch_and_clear_caches()
  local current_branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("%s+", "")
  if vim.g.last_git_branch and vim.g.last_git_branch ~= current_branch and current_branch ~= "" then
    vim.notify("Branch changed: clearing caches", vim.log.levels.INFO)

    -- Clear LSP caches and restart clients
    vim.lsp.stop_client(vim.lsp.get_clients())

    -- Clear buffer diagnostics
    vim.diagnostic.reset()

    -- Reload all buffers
    vim.cmd("checktime")
  end
  vim.g.last_git_branch = current_branch
end

-- Check on terminal leave (for LazyGit inside LazyVim)
vim.api.nvim_create_autocmd("TermLeave", {
  callback = check_branch_and_clear_caches,
  desc = "Clear caches on git branch change (terminal)",
})

-- Check on focus gained (for external git commands)
vim.api.nvim_create_autocmd("FocusGained", {
  callback = check_branch_and_clear_caches,
  desc = "Clear caches on git branch change (focus)",
})

