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
      provider = "claude",
      providers = {
        claude4 = {
          endpoint = "https://api.anthropic.com/v1/messages",
          model = "claude-sonnet-4-20250514",
          api_key_name = "ANTHROPIC_API_KEY",
        },
        groq = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1/",
          model = "llama-3.3-70b-versatile",
          extra_request_body = {
            max_completion_tokens = 32768,
          },
        },
      },

      cursor_applying_provider = "groq",
      behaviour = {
        auto_focus_sidebar = false,
        enable_cursor_planning_mode = true,
        auto_apply_diff_after_generation = true,
        auto_approve_tool_permissions = true,
      },

      -- Using LazyVim Copilot Extra
      -- auto_suggestions = false,
      -- auto_suggestions_provider = "copilot",

      selector = {
        file_selector_provider = "telescope",
      },
    },
  },
  { -- Add completion source for Avante
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or {}

      -- Add "avante" if not already present
      if not vim.tbl_contains(opts.sources.default, "avante") then
        table.insert(opts.sources.default, 1, "avante") -- insert at the top if desired
      end

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.avante = {
        module = "blink-cmp-avante",
        name = "Avante",
        score_offset = 100, -- Higher priority
        opts = {},
      }
    end,
  },
  { -- Add Avante toggle command to Neo-tree
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
