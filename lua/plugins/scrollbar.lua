return {
  {
    "dstein64/nvim-scrollview",
    event = "BufRead",
    opts = {
      winblend = 50,
      signs_on_startup = {
        "all",
        -- "conflicts",
        -- "cursor",
        -- "diagnostics",
        -- "folds",
        -- "loclist",
        -- "marks",
        -- "quickfix",
        -- "search",
        -- "spell",
        -- "textwidth",
        -- "trail",
      },
    },
    config = true,
    cmd = { "ScrollViewToggle", "ScrollViewEnable", "ScrollViewDisable" },
  },
}
