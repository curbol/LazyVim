-- VSCode-specific options

if not vim.g.vscode then
  return
end

-- Disable some options that VSCode handles
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.signcolumn = "no"
vim.opt.foldcolumn = "0"
vim.opt.wrap = false
vim.opt.conceallevel = 0

-- Keep some useful options
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Set clipboard to use VSCode's clipboard
vim.g.clipboard = vim.g.vscode_clipboard

-- Disable swap files and backup (VSCode handles this)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
