return {
  "RyanMillerC/better-vim-tmux-resizer",
  cmd = {
    "TmuxResizeLeft",
    "TmuxResizeDown",
    "TmuxResizeUp",
    "TmuxResizeRight",
  },
  keys = {
    { "<m-h>", "<cmd><C-U>TmuxResizeLeft<cr>" },
    { "<m-j>", "<cmd><C-U>TmuxResizeDown<cr>" },
    { "<m-k>", "<cmd><C-U>TmuxResizeUp<cr>" },
    { "<m-l>", "<cmd><C-U>TmuxResizeRight<cr>" },
  },
}
