if true then return {} end

return {
  {
    "ravitemer/mcphub.nvim",
    event = "VeryLazy",
    build = "npm install -g mcp-hub@latest",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      extensions = {
        avante = {
          make_slash_commands = true, -- make /slash commands from MCP server prompts
        },
      },
    },
    keys = {
      {
        "<leader>am",
        function()
          vim.cmd("MCPHub")
        end,
        desc = "MCPHub",
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    version = false, -- always use latest

    opts = {
      -- system_prompt as function ensures LLM always has latest MCP server state
      -- This is evaluated for every message, even in existing chats
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,

      -- Using function prevents requiring mcphub before it's loaded
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,

      disabled_tools = {
        "list_files", -- Built-in file operations
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash", -- Built-in terminal access
      },

      -- This sets vim.g.mcphub_auto_approve to true by default (can also be toggled from the HUB UI with `ga`)
      auto_approve = true,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      opts.sections = opts.sections or {}
      opts.sections.lualine_x = opts.sections.lualine_x or {}
      table.insert(opts.sections.lualine_x, { require("mcphub.extensions.lualine") })
    end,
  },
}
