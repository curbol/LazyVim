return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Disable warnings like "struct with 168 pointer bytes could be 152"
    opts.servers.gopls.settings.gopls.analyses.fieldalignment = false

    -- Disable inlay hints (e.g. type hints)
    opts.inlay_hints.enabled = false
  end,
}
