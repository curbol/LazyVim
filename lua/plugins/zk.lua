return {
  "zk-org/zk-nvim",
  keys = {
    { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "New Note" },
    { "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Open Notes" },
    { "<leader>zt", "<Cmd>ZkTags<CR>", desc = "Tags" },
    { "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", desc = "Find Notes" },
    { "<leader>znt", ":'<,'>ZkNewFromTitleSelection<CR>", desc = "New Note from Title", mode = "v" },
    { "<leader>znc", ":'<,'>ZkNewFromContentSelection<CR>", desc = "New Note from Content", mode = "v" },
    { "<leader>zb", "<Cmd>ZkBacklinks<CR>", desc = "Backlinks" },
    { "<leader>zl", "<Cmd>ZkLinks<CR>", desc = "Links" },
  },
  config = function()
    require("zk").setup({
      picker = "telescope",
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
        },
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })
  end,
}