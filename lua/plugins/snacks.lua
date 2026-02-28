return {
  "folke/snacks.nvim",
  opts = {
    styles = {
      float = {
        border = "rounded",
      },
    },
    picker = {
      sources = {
        files = {
          hidden = true,
        },
        explorer = {
          win = {
            list = {
              keys = {
                ["<Right>"] = "confirm",
                ["<Left>"] = "explorer_close",
              },
            },
          },
        },
      },
    },
  },
}
