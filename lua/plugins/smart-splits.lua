return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  keys = {
    { "<C-S-Left>",  function() require("smart-splits").swap_buf_left() end,  desc = "Swap window left" },
    { "<C-S-Right>", function() require("smart-splits").swap_buf_right() end, desc = "Swap window right" },
    { "<C-S-Up>",    function() require("smart-splits").swap_buf_up() end,    desc = "Swap window up" },
    { "<C-S-Down>",  function() require("smart-splits").swap_buf_down() end,  desc = "Swap window down" },
  },
}
