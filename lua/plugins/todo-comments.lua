-- FIX: test FIXME
-- HACK: test HACK
-- TODO: test TODO
-- NOTE: test NOTE
-- PERF: test PERF

return {
  "folke/todo-comments.nvim",
  event = "LazyFile",
  opts = function(_, opts)
    opts.colors = {
      error = { "DiagnosticError", "ErrorMsg", "#f2594b" },
      warning = { "DiagnosticWarn", "WarningMsg", "#e9b143" },
      info = { "DiagnosticInfo", "#40aade" },
      hint = { "DiagnosticHint", "#8bba7f" },
      default = { "Identifier", "#d3869b" },
      test = { "Identifier", "#FF00FF" },
    }
  end,
}
