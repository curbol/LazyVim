return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["<Right>"] = "open",
          ["<Left>"] = "close_node",
        },
      },
    },
    buffers = {
      window = {
        mappings = {
          ["<Right>"] = "open",
          ["<Left>"] = "close_node",
        },
      },
    },
    git_status = {
      window = {
        mappings = {
          ["<Right>"] = "open",
          ["<Left>"] = "close_node",
        },
      },
    },
  },
}
