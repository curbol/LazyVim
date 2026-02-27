return {
  "nvim-mini/mini.move",
  event = "VeryLazy",
  opts = {
    mappings = {
      -- Move visual selection (ctrl+shift+arrows)
      left = "<C-S-Left>",
      right = "<C-S-Right>",
      down = "<C-S-Down>",
      up = "<C-S-Up>",

      -- Line movement in Normal mode (disabled)
      line_left = "",
      line_right = "",
      line_down = "",
      line_up = "",
    },
  },
  keys = {
    { mode = { "v" }, "<C-S-Left>",  desc = "Move selection left" },
    { mode = { "v" }, "<C-S-Right>", desc = "Move selection right" },
    { mode = { "v" }, "<C-S-Down>",  desc = "Move selection down" },
    { mode = { "v" }, "<C-S-Up>",    desc = "Move selection up" },
  },
}
