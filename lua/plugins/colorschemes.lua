return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    name = "gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "material"
      -- vim.g.gruvbox_material_disable_italic_comment = 0
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      -- vim.g.gruvbox_material_cursor = "auto"
      vim.g.gruvbox_material_transparent_background = 1
      -- vim.g.gruvbox_material_dim_inactive_windows = 0
      -- vim.g.gruvbox_material_visual = "grey background"
      vim.g.gruvbox_material_menu_selection_background = "blue"
      -- vim.g.gruvbox_material_sign_column_background = "none"
      -- vim.g.gruvbox_material_spell_foreground = "none"
      -- vim.g.gruvbox_material_ui_contrast = "low"
      -- vim.g.gruvbox_material_show_eob = 1
      vim.g.gruvbox_material_float_style = "dim"
      -- vim.g.gruvbox_material_diagnostic_text_highlight = 0
      -- vim.g.gruvbox_material_diagnostic_line_highlight = 0
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_current_word = "underline" -- 'grey background', 'bold', 'underline', 'italic'
      -- vim.g.gruvbox_material_disable_terminal_colors = 0
      -- vim.g.gruvbox_material_statusline_style = "default"
      -- vim.g.gruvbox_material_lightline_disable_bold = 0
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_colors_override = {
        -- https://github.com/sainnhe/gruvbox-material/blob/master/autoload/gruvbox_material.vim
        bg_dim = { "#32302f", "236" }, -- default: { "#1b1b1b", "233" }
      }

      -- Set custom highlight for MsgArea
      vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
        group = vim.api.nvim_create_augroup("Color", {}),
        pattern = "*",
        callback = function()
          -- #3a3a3a ends up being #2d2d2d for some reason
          vim.api.nvim_set_hl(0, "MsgArea", { bg = "#3a3a3a" })
        end,
        desc = "Set custom highlight for MsgArea",
      })
    end,
  },
}
