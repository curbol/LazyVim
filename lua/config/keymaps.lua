-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keep cursor in place while joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Center cursor when scrolling and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down and Center Cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up and Center Cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Result and Center Cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous Search Result and Center Cursor" })

-- Change all occurrences of the word under the cursor
vim.keymap.set(
  "n",
  "<leader>cs",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Change All Occurrences of Word Under Cursor" }
)

-- Change all occurrences of the visually selected text
vim.keymap.set("v", "<leader>cs", [[:<C-u>%s/\V<C-r>"/<C-r>"/gI<Left><Left><Left>]], {
  desc = "Change All Occurrences of Visually Selected Text",
})

-- Use <C-h> and <C-l> to navigate in command mode and insert mode
vim.keymap.set({ "c", "i" }, "<C-h>", "<Left>", { desc = "Move Cursor Left" })
vim.keymap.set({ "c", "i" }, "<C-l>", "<Right>", { desc = "Move Cursor Right" })

-- Save all buffers
vim.keymap.set("n", "<leader>bs", "<cmd>wall<CR>", { desc = "Save All Buffers" })

-- Clear unsaved buffer changes
vim.keymap.set("n", "<leader>bz", ":e!<CR>", { desc = "Clear Unsaved Buffer Changes" })

-- Search the directory of the current buffer
pcall(vim.keymap.del, "n", "<leader>sG")
vim.keymap.set("n", "<leader>sG", function()
  require("telescope.builtin").live_grep({
    search_dirs = { vim.fn.expand("%:p:h") },
  })
end, { desc = "Grep (Buffer Dir)" })

if vim.g.vscode then
  require("config.vscode.keymaps")
end
