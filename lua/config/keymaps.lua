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

-- Paste and keep buffer
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste and Keep Buffer" })

-- Window management
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equalize Windows" })

-- Change all occurrences of the word under the cursor
vim.keymap.set(
  "n",
  "<leader>cs",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Change All Occurrences of Word Under Cursor" }
)

-- Use <C-h> and <C-l> to navigate in command mode and insert mode
vim.keymap.set({ "c", "i" }, "<C-h>", "<Left>", { desc = "Move Cursor Left" })
vim.keymap.set({ "c", "i" }, "<C-l>", "<Right>", { desc = "Move Cursor Right" })

-- Clear unsaved buffer changes
vim.keymap.set("n", "<leader>bx", ":e!<CR>", { desc = "Clear Unsaved Buffer Changes" })

-- Add lines
vim.keymap.set("n", "<leader>o", "o<esc>", { desc = "Add Line Below" })
vim.keymap.set("n", "<leader>O", "O<esc>", { desc = "Add Line Above" })
