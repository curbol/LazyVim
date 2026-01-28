local function get_claude_config_dir()
  local work_orgs = { "sagansystems", "gladly" }
  local remote = vim.fn.system("git remote get-url origin 2>/dev/null"):gsub("%s+$", "")
  if vim.v.shell_error == 0 then
    for _, org in ipairs(work_orgs) do
      if remote:find("/" .. org .. "/", 1, true) or remote:find(":" .. org .. "/", 1, true) then
        return vim.fn.expand("~/.claude-work"), org
      end
    end
  end
  return vim.fn.expand("~/.claude"), nil
end

vim.api.nvim_create_user_command("ClaudeConfigDir", function()
  local dir, org = get_claude_config_dir()
  if org then
    vim.notify("Claude config: " .. dir .. " (org: " .. org .. ")", vim.log.levels.INFO)
  else
    vim.notify("Claude config: " .. dir .. " (personal)", vim.log.levels.INFO)
  end
end, {})

return {
  {
    "coder/claudecode.nvim",
    opts = function(_, opts)
      local dir = get_claude_config_dir()
      if dir == vim.fn.expand("~/.claude-work") then
        opts.env = opts.env or {}
        opts.env.CLAUDE_CONFIG_DIR = dir
      end
    end,
  },
}
