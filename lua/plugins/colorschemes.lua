return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
  {
    -- https://github.com/sainnhe/gruvbox-material/blob/master/autoload/gruvbox_material.vim
    "sainnhe/gruvbox-material",
    lazy = true,
    name = "gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "material"
      -- vim.g.gruvbox_material_disable_italic_comment = 0
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      -- vim.g.gruvbox_material_cursor = "auto" -- (GUIs only) 'auto', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple'
      vim.g.gruvbox_material_transparent_background = 1
      -- vim.g.gruvbox_material_dim_inactive_windows = 0
      -- vim.g.gruvbox_material_visual = "grey background"
      vim.g.gruvbox_material_menu_selection_background = "orange" -- 'grey', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple'
      -- vim.g.gruvbox_material_sign_column_background = "none"
      -- vim.g.gruvbox_material_spell_foreground = "none"
      -- vim.g.gruvbox_material_ui_contrast = "low"
      -- vim.g.gruvbox_material_show_eob = 1
      vim.g.gruvbox_material_float_style = "blend"
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      -- vim.g.gruvbox_material_diagnostic_line_highlight = 0
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_current_word = "underline" -- 'grey background', 'bold', 'underline', 'italic'
      -- vim.g.gruvbox_material_disable_terminal_colors = 0
      -- vim.g.gruvbox_material_statusline_style = "default"
      -- vim.g.gruvbox_material_lightline_disable_bold = 0
      vim.g.gruvbox_material_better_performance = 1

      -- Force a visible FloatBorder after colorscheme loads
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruvbox-material",
        callback = function()
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#a89984" })
        end,
      })
    end,
  },
}
