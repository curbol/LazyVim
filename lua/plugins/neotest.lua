return {
  "nvim-neotest/neotest",
  opts = function(_, opts)
    -- Hide virtual text because gutter symbols are enough
    opts.status.virtual_text = false
  end,
}
