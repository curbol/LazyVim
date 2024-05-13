return {
  {
    "dstein64/nvim-scrollview",
    event = "BufRead",
    opts = {
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
      excluded_filetypes = {
        "neo-tree",
        "dashboard",
      },
    },
    config = true,
    cmd = { "ScrollViewToggle", "ScrollViewEnable", "ScrollViewDisable" },
  },
}
