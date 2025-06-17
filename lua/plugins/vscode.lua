-- VSCode-specific configuration
-- This file only loads when vim.g.vscode is set

if not vim.g.vscode then
  return {}
end

return {
  -- Disable plugins that don't work well with VSCode
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "stevearc/dressing.nvim", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "nvim-telescope/telescope.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },
  { "lewis6991/gitsigns.nvim", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
  { "neovim/nvim-lspconfig", enabled = false },
  { "hrsh7th/nvim-cmp", enabled = false },
  { "echasnovski/mini.starter", enabled = false },
  { "folke/snacks.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "nvim-pack/nvim-spectre", enabled = false },
  { "folke/todo-comments.nvim", enabled = false },
  
  -- Enable plugins that work well with VSCode
  {
    "folke/lazy.nvim",
    vscode = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    vscode = true,
    opts = {
      highlight = { enable = false }, -- VSCode handles syntax highlighting
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    vscode = true,
  },
  {
    "echasnovski/mini.ai",
    vscode = true,
  },
  {
    "echasnovski/mini.comment",
    vscode = true,
  },
  {
    "echasnovski/mini.move",
    vscode = true,
  },
  {
    "echasnovski/mini.pairs",
    vscode = true,
  },
  {
    "echasnovski/mini.surround",
    vscode = true,
  },
  {
    "tpope/vim-repeat",
    vscode = true,
  },
  {
    "gbprod/yanky.nvim",
    vscode = true,
  },
  {
    "ggandor/leap.nvim",
    vscode = true,
  },
  {
    "ggandor/flit.nvim",
    vscode = true,
  },
  {
    "monaqa/dial.nvim",
    vscode = true,
  },
}