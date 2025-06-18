if not vim.g.vscode then
  return
end

local vscode = require("vscode")

require("config.vscode.keymaps.buffers")
require("config.vscode.keymaps.code")
require("config.vscode.keymaps.core")
require("config.vscode.keymaps.diagnostics")
require("config.vscode.keymaps.files")
require("config.vscode.keymaps.git")
require("config.vscode.keymaps.search")
require("config.vscode.keymaps.ui")
require("config.vscode.keymaps.whichkey")
require("config.vscode.keymaps.windows")

-- Terminal function override for LazyVim compatibility
function LazyVim.terminal()
  vscode.action("workbench.action.terminal.toggleTerminal")
end
