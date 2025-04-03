return {
  "augmentcode/augment.vim",
  cmd = "Augment",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>ac", "<cmd>Augment chat<cr>", mode = { "n", "v" }, desc = "Ask" },
    { "<leader>an", "<cmd>Augment chat-new<cr>", desc = "New Chat" },
    { "<leader>at", "<cmd>Augment chat-toggle<cr>", desc = "Toggle Chat" },
  },
  init = function()
    -- Workspace configuration
    vim.g.augment_workspace_folders = {
      "~/.dotfiles",
      "~/config/.nvim",
      "~/code/zmk-config",

      -- Gladly
      "~/code/supernova",
      "~/code/agent-desktop",
      "~/code/thankful",
    }

    -- Additional Augment settings
    -- vim.g.augment_disable_tab_mappng = true
    -- vim.g.augment_disable_completions = true
  end,
}
