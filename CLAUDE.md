# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Codebase Overview

This is a Neovim configuration built on the LazyVim framework. LazyVim provides a modern, extensible Neovim configuration with sensible defaults and a plugin management system based on lazy.nvim.

### Architecture

- **Entry point**: `init.lua` - bootstraps the LazyVim configuration
- **Configuration core**: `lua/config/lazy.lua` - sets up lazy.nvim and imports LazyVim with extensive extras
- **Custom configurations**:
  - `lua/config/` - core Neovim settings (options, keymaps, autocmds)
  - `lua/plugins/` - custom plugin configurations and overrides
- **Plugin management**: Uses lazy.nvim for plugin installation and management

### Key Configuration Structure

The configuration follows LazyVim's modular approach:

1. **LazyVim Extras**: Pre-configured plugin sets imported in `lua/config/lazy.lua`:
   - AI: Copilot and Copilot Chat
   - Languages: TypeScript, Python, Go, Rust, Docker, Terraform, and more
   - Editor: Harpoon2, Telescope, Refactoring tools
   - Testing: Core testing framework
   - DAP: Debug Adapter Protocol support

2. **Custom Plugins**: Located in `lua/plugins/` directory, each file represents plugin configurations
3. **Disabled Plugins**: `lua/plugins/disabled.lua` contains plugins that are explicitly disabled

## Development Commands

### Code Formatting
```bash
stylua . --config-path stylua.toml
```

### Plugin Management
- `:Lazy` - Open lazy.nvim plugin manager
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Sync plugins (install missing, update existing)

### Health Checks
- `:checkhealth` - Run Neovim health checks
- `:checkhealth lazy` - Check lazy.nvim status

## Configuration Guidelines

### Adding New Plugins
Create a new `.lua` file in `lua/plugins/` directory. Each file should return a table with plugin specifications following lazy.nvim format.

### Modifying Existing Plugins
Either create overrides in `lua/plugins/` or add plugins to `lua/plugins/disabled.lua` to disable them.

### Custom Keymaps and Options
- Global options: Add to `lua/config/options.lua`
- Custom keymaps: Add to `lua/config/keymaps.lua`
- Autocommands: Add to `lua/config/autocmds.lua`

### LazyVim Integration
This configuration heavily relies on LazyVim's extras system. When adding language support or major features, prefer using LazyVim extras over custom configurations when available.

## Important Files

- `lazy-lock.json` - Pin plugin versions (commit this file)
- `lazyvim.json` - LazyVim configuration state
- `.neoconf.json` - Neoconf settings for Lua development
- `stylua.toml` - Lua code formatting configuration