return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Disable warnings like "struct with 168 pointer bytes could be 152"
    opts.servers.gopls.settings.gopls.analyses.fieldalignment = false

    -- Add build flags for gopls to include integration and e2e tests so that diagnostics are shown
    opts.servers.gopls.settings.gopls.buildFlags = { "-tags=integration,e2e" }

    -- Disable inlay hints (input argument types)
    opts.inlay_hints.enabled = false
  end,
}
