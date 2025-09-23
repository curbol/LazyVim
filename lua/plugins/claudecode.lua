return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = function()
    require("claudecode").setup({})

    -- Add terminal mode navigation for Claude Code pane
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.keymap.set("t", "<C-Left>", function()
          require("smart-splits").move_cursor_left()
        end, { buffer = buf, desc = "Smart-splits: move left (terminal)" })

        vim.keymap.set("t", "<C-Right>", function()
          require("smart-splits").move_cursor_right()
        end, { buffer = buf, desc = "Smart-splits: move right (terminal)" })

        vim.keymap.set("t", "<C-Up>", function()
          require("smart-splits").move_cursor_up()
        end, { buffer = buf, desc = "Smart-splits: move up (terminal)" })

        vim.keymap.set("t", "<C-Down>", function()
          require("smart-splits").move_cursor_down()
        end, { buffer = buf, desc = "Smart-splits: move down (terminal)" })
      end,
    })
  end,
  keys = {
    -- CopilotChat already uses: <leader>aa (toggle), <leader>ap (prompt), <leader>aq (quick), <leader>ax (clear)
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle (Claude)" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus (Claude)" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume (Claude)" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue (Claude)" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Model (Claude)" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add Current Buffer (Claude)" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send Selection (Claude)" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add File (Claude)",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
    },
    -- Diff management - avoid conflict with CopilotChat's <leader>aa
    { "<leader>ad", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Diff (Claude)" },
    { "<leader>aD", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Diff (Claude)" },
  },
}
