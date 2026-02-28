return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  opts = {
    cursor_follows_swapped_bufs = true,
  },
  keys = {
    { "<C-S-Left>",  function() require("smart-splits").swap_buf_left() end,  desc = "Move window left" },
    { "<C-S-Right>", function() require("smart-splits").swap_buf_right() end, desc = "Move window right" },
    { "<C-S-Up>",    function() require("smart-splits").swap_buf_up() end,    desc = "Move window up" },
    { "<C-S-Down>",  function() require("smart-splits").swap_buf_down() end,  desc = "Move window down" },
  },
}
