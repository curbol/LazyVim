return {
  "echasnovski/mini.move",
  event = "VeryLazy",
  opts = {
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      left = "<M-h>",
      right = "<M-l>",
      down = "<M-j>",
      up = "<M-k>",

      -- Move current line in Normal mode
      line_left = "",
      line_right = "",
      line_down = "",
      line_up = "",
    },
  },
  keys = {
    { mode = { "v" }, "<M-h>", desc = "Move selection left" },
    { mode = { "v" }, "<M-j>", desc = "Move selection down" },
    { mode = { "v" }, "<M-k>", desc = "Move selection up" },
    { mode = { "v" }, "<M-l>", desc = "Move selection right" },
  },
}
