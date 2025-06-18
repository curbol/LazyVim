if not vim.g.vscode then
  return
end

local vscode = require("vscode")

-- Auto-commands for better VSCode integration
local augroup = vim.api.nvim_create_augroup("VSCodeIntegration", { clear = true })

-- Sync VSCode tab/buffer state with Neovim
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  callback = function()
    -- Ensure VSCode cursor position is synchronized
    vim.schedule(function()
      if vim.g.vscode then
        local cursor = vim.api.nvim_win_get_cursor(0)
        vscode.call("vscode-neovim.lua", {
          args = {
            string.format("vim.api.nvim_win_set_cursor(0, {%d, %d})", cursor[1], cursor[2])
          }
        })
      end
    end)
  end,
})

-- Clear search highlighting when losing focus (VSCode-friendly)
vim.api.nvim_create_autocmd("FocusLost", {
  group = augroup,
  callback = function()
    vim.cmd("nohlsearch")
  end,
})

-- Improve search experience in VSCode
vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = augroup,
  pattern = { "/", "?" },
  callback = function()
    vim.opt.hlsearch = true
  end,
})

-- Better yank highlighting that works with VSCode
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({
      higroup = "Visual",
      timeout = 200,
    })
  end,
})

-- Ensure proper insert mode handling
vim.api.nvim_create_autocmd("InsertEnter", {
  group = augroup,
  callback = function()
    -- Let VSCode handle insert mode completely
    vim.cmd("stopinsert")
  end,
})

-- File type specific configurations for better VSCode integration
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "text" },
  callback = function()
    -- Enable word wrap for text files
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- Improve folding integration with VSCode
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup,
  callback = function()
    -- Use VSCode's folding instead of vim's
    vim.opt_local.foldmethod = "manual"
    vim.opt_local.foldenable = false
  end,
})
