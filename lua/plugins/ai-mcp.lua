return {
  {
    "ravitemer/mcphub.nvim",
    event = "VeryLazy",
    cmd = "MCPHub",
    opts = {},
    keys = {
      {
        "<leader>am",
        function()
          vim.cmd("MCPHub")
        end,
        desc = "Open MCPHub",
      },
    },
  },
}
