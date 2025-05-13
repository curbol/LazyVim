return {
  { -- FIX: Using this for navigation from nvim->wezterm because smart-splits is really laggy for some reason.
    "letieu/wezterm-move.nvim",
    keys = {
      -- Navigation (Vim keys)
      {
        "<C-h>",
        function()
          require("wezterm-move").move("h")
        end,
      },
      {
        "<C-j>",
        function()
          require("wezterm-move").move("j")
        end,
      },
      {
        "<C-k>",
        function()
          require("wezterm-move").move("k")
        end,
      },
      {
        "<C-l>",
        function()
          require("wezterm-move").move("l")
        end,
      },

      -- Navigation (Arrow keys)
      {
        "<C-Left>",
        function()
          require("wezterm-move").move("h")
        end,
        desc = "Wezterm move left (arrow)",
      },
      {
        "<C-Down>",
        function()
          require("wezterm-move").move("j")
        end,
        desc = "Wezterm move down (arrow)",
      },
      {
        "<C-Up>",
        function()
          require("wezterm-move").move("k")
        end,
        desc = "Wezterm move up (arrow)",
      },
      {
        "<C-Right>",
        function()
          require("wezterm-move").move("l")
        end,
        desc = "Wezterm move right (arrow)",
      },
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    opts = {},
    keys = {
      -- Resizing (Vim keys)
      {
        "<A-h>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Smart-splits: resize left",
      },
      {
        "<A-j>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Smart-splits: resize down",
      },
      {
        "<A-k>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Smart-splits: resize up",
      },
      {
        "<A-l>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Smart-splits: resize right",
      },

      -- Resizing (Arrow keys)
      {
        "<A-Left>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Smart-splits: resize left (arrow)",
      },
      {
        "<A-Down>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Smart-splits: resize down (arrow)",
      },
      {
        "<A-Up>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Smart-splits: resize up (arrow)",
      },
      {
        "<A-Right>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Smart-splits: resize right (arrow)",
      },

      -- Swapping buffers (Vim keys)
      {
        "<leader><leader>h",
        function()
          require("smart-splits").swap_buf_left()
        end,
        desc = "Smart-splits: swap buf left",
      },
      {
        "<leader><leader>j",
        function()
          require("smart-splits").swap_buf_down()
        end,
        desc = "Smart-splits: swap buf down",
      },
      {
        "<leader><leader>k",
        function()
          require("smart-splits").swap_buf_up()
        end,
        desc = "Smart-splits: swap buf up",
      },
      {
        "<leader><leader>l",
        function()
          require("smart-splits").swap_buf_right()
        end,
        desc = "Smart-splits: swap buf right",
      },

      -- Swapping buffers (Arrow keys)
      {
        "<leader><leader><Left>",
        function()
          require("smart-splits").swap_buf_left()
        end,
        desc = "Smart-splits: swap buf left (arrow)",
      },
      {
        "<leader><leader><Down>",
        function()
          require("smart-splits").swap_buf_down()
        end,
        desc = "Smart-splits: swap buf down (arrow)",
      },
      {
        "<leader><leader><Up>",
        function()
          require("smart-splits").swap_buf_up()
        end,
        desc = "Smart-splits: swap buf up (arrow)",
      },
      {
        "<leader><leader><Right>",
        function()
          require("smart-splits").swap_buf_right()
        end,
        desc = "Smart-splits: swap buf right (arrow)",
      },
    },
  },
}
