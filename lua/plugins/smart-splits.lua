return {
  { -- Using this for navigation from nvim->wezterm because smart-splits is really laggy for some reason.
    "letieu/wezterm-move.nvim",
    keys = { -- Lazy loading, don't need call setup() function
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
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    opts = {
      -- ignored_filetypes = { "neo-tree" },
    },
    keys = {
      -- Resizing
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

      -- Moving between splits. Smart-splits is really laggy for this case. Maybe it will be fixed in the future.
      -- {
      --   "<C-h>",
      --   function()
      --     require("smart-splits").move_cursor_left()
      --   end,
      --   desc = "Smart-splits: move left",
      -- },
      -- {
      --   "<C-j>",
      --   function()
      --     require("smart-splits").move_cursor_down()
      --   end,
      --   desc = "Smart-splits: move down",
      -- },
      -- {
      --   "<C-k>",
      --   function()
      --     require("smart-splits").move_cursor_up()
      --   end,
      --   desc = "Smart-splits: move up",
      -- },
      -- {
      --   "<C-l>",
      --   function()
      --     require("smart-splits").move_cursor_right()
      --   end,
      --   desc = "Smart-splits: move right",
      -- },
      -- {
      --   "<C-\\>",
      --   function()
      --     require("smart-splits").move_cursor_previous()
      --   end,
      --   desc = "Smart-splits: move previous split",
      -- },

      -- Swapping buffers
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
    },
  },
}
