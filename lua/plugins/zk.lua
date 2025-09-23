return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          root_dir = function(fname)
            -- Validate input parameter
            if type(fname) ~= "string" or fname == "" then
              return nil
            end

            -- Only disable marksman in zk notebooks
            local ok, zk_util = pcall(require, "zk.util")
            if ok then
              local success, zk_root = pcall(zk_util.notebook_root, fname)
              if success and zk_root then
                return nil -- Disable marksman in zk notebooks
              end
            end

            -- Use default marksman root detection for other markdown files
            return require("lspconfig.util").root_pattern(".git", ".marksman.toml")(fname)
          end,
        },
      },
    },
  },
  {
    "zk-org/zk-nvim",
    ft = "markdown",
    keys = {
      { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "New Note" },
      { "<leader>fz", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Open Notes" },
      { "<leader>zt", "<Cmd>ZkTags<CR>", desc = "Tags" },
      { "<leader>zb", "<Cmd>ZkBacklinks<CR>", desc = "Backlinks" },
      { "<leader>zl", "<Cmd>ZkLinks<CR>", desc = "Links" },
      {
        "<leader>sz",
        function()
          require("telescope.builtin").live_grep({
            cwd = vim.env.ZK_NOTEBOOK_DIR,
            prompt_title = "Grep Notes",
          })
        end,
        desc = "Grep Notes",
      },
    },
    config = function()
      require("zk").setup({
        picker = "telescope",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end,
  },
}
