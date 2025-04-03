vim.g.augment_workspace_folders = {
  "~/.dotfiles",
  "~/config/.nvim",
  "~/code/zmk-config",

  -- Gladly
  "~/code/supernova",
  "~/code/agent-desktop",
  "~/code/thankful",
}

return {
  {
    "augmentcode/augment.vim",
    keys = {
      { "<leader>ac", "<cmd>Augment chat<cr>", mode = { "n", "v" }, desc = "Chat" },
      { "<leader>an", "<cmd>Augment chat-new<cr>", desc = "New Chat" },
      { "<leader>at", "<cmd>Augment chat-toggle<cr>", desc = "Toggle Chat" },
    },
  },
}
