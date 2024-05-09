return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options.separator_style = { "│", "│" }
    opts.options.indicator = {
      style = "none",
    }
  end,
}
