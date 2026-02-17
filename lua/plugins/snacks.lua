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
