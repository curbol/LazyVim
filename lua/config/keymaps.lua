-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keep cursor in place while joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Center cursor when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Center cursor when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank, change, delete to register
vim.keymap.set({ "n", "v" }, "<leader>ry", [["ry]], { desc = "yank to register" })
vim.keymap.set("n", "<leader>rY", [["rY]], { desc = "Yank to register" })
vim.keymap.set({ "n", "v" }, "<leader>rc", [["rc]], { desc = "change to register" })
vim.keymap.set("n", "<leader>rC", [["rC]], { desc = "Change to register" })
vim.keymap.set({ "n", "v" }, "<leader>rd", [["rd]], { desc = "delete to register" })
vim.keymap.set("n", "<leader>rD", [["rD]], { desc = "Delete to register" })
vim.keymap.set("n", "<leader>rp", [["rp]], { desc = "paste from register" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste and keep buffer" })

vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equalize windows" })
