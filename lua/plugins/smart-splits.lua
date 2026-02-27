return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    opts = {},
    keys = {
      -- Moving between splits (Arrow keys)
      {
        "<C-Left>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        mode = { "n", "t" },
        desc = "Smart-splits: move left",
      },
      {
        "<C-Down>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        mode = { "n", "t" },
        desc = "Smart-splits: move down",
      },
      {
        "<C-Up>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        mode = { "n", "t" },
        desc = "Smart-splits: move up",
      },
      {
        "<C-Right>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        mode = { "n", "t" },
        desc = "Smart-splits: move right",
      },

      -- Swapping windows (ctrl+shift+arrows = move)
      {
        "<C-S-Left>",
        function()
          require("smart-splits").swap_buf_left()
        end,
        desc = "Smart-splits: swap window left",
      },
      {
        "<C-S-Down>",
        function()
          require("smart-splits").swap_buf_down()
        end,
        desc = "Smart-splits: swap window down",
      },
      {
        "<C-S-Up>",
        function()
          require("smart-splits").swap_buf_up()
        end,
        desc = "Smart-splits: swap window up",
      },
      {
        "<C-S-Right>",
        function()
          require("smart-splits").swap_buf_right()
        end,
        desc = "Smart-splits: swap window right",
      },
    },
  },
}
