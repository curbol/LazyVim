return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    version = false, -- always use latest

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-web-devicons",
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
        model = "gemini-2.5-pro-preview-05-06",
      },

      selector = {
        file_selector_provider = "telescope",
      },
    },

    keys = {
      {
        "<leader>ab",
        function()
          local sidebar = require("avante").get(true)
          sidebar.file_selector:add_current_buffer()
          vim.notify("Added current buffer to Avante context", vim.log.levels.INFO)
        end,
        desc = "Avante: Add Current Buffer",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.commands = opts.filesystem.commands or {}
      opts.filesystem.commands.avante_toggle_file = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local relative_path = require("avante.utils").relative_path(filepath)

        local sidebar = require("avante").get()

        local open = sidebar:is_open()
        if not open then
          require("avante.api").ask()
          sidebar = require("avante").get()
        end

        local file_selector = sidebar.file_selector

        -- Check if file is already selected
        local selected = file_selector:get_selected_filepaths()
        local is_selected = false
        for _, path in ipairs(selected) do
          if path == relative_path then
            is_selected = true
            break
          end
        end

        if is_selected then
          file_selector:remove_selected_file(relative_path)
        else
          file_selector:add_selected_file(relative_path)
        end

        -- Remove phantom Neo-tree buffer if needed
        if not open then
          file_selector:remove_selected_file("neo-tree filesystem [1]")
        end
      end

      opts.filesystem.window = opts.filesystem.window or {}
      opts.filesystem.window.mappings = opts.filesystem.window.mappings or {}
      opts.filesystem.window.mappings["oa"] = "avante_toggle_file"
    end,
  },
}
