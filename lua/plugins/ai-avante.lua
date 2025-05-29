return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  version = false, -- always use latest

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      build = ":Copilot auth",
      opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },

  opts = {
    provider = "gemini",
    auto_suggestions = true,
    auto_suggestions_provider = "copilot",

    gemini = {
      model = "gemini-1.5-flash", -- or "gemini-1.5-pro-exp-0827"
      temperature = 0,
      max_tokens = 4096,
    },

    behaviour = {
      auto_set_keymaps = true,
    },

    selector = {
      file_selector_provider = "telescope",
      exclude_auto_select = { "NvimTree" },
    },
  },

  keys = {
    {
      "<leader>a+",
      function()
        require("avante.extensions.nvim_tree").add_file()
      end,
      desc = "Avante: Select file for context",
      ft = "NvimTree",
    },
    {
      "<leader>a-",
      function()
        require("avante.extensions.nvim_tree").remove_file()
      end,
      desc = "Avante: Deselect file from context",
      ft = "NvimTree",
    },
  },
}
