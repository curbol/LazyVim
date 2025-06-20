return {
  "echasnovski/mini.move",
  event = "VeryLazy",
  opts = {
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt + hjkl.
      left = "<M-Left>",
      right = "<M-Right>",
      down = "<M-Down>",
      up = "<M-Up>",

      -- Move current line in Normal mode
      line_left = "",
      line_right = "",
      line_down = "",
      line_up = "",
    },
  },
  keys = {
    { mode = { "v" }, "<M-Left>", desc = "Move selection left" },
    { mode = { "v" }, "<M-Right>", desc = "Move selection right" },
    { mode = { "v" }, "<M-Down>", desc = "Move selection down" },
    { mode = { "v" }, "<M-Up>", desc = "Move selection up" },
  },
}
