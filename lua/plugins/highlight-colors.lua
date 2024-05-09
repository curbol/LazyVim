return {
  "brenoprata10/nvim-highlight-colors",
  event = "LazyFile",
  opts = function(_, opts)
    opts.render = "virtual" -- "background" | "foreground" | "virtual"
    opts.virtual_symbol = "■" -- ●
    opts.enable_named_colors = true
    opts.enable_tailwind = true
    -- opts.custom_colors = {
    --   { label = "color-name", color = "#000000" },
    -- }
  end,
}
