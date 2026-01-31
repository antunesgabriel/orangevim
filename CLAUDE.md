# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

OrangeVim is a Neovim colorscheme with vibrant orange accents, inspired by the Dark Orange VSCode theme. It's distributed as a Neovim plugin that can be installed via package managers like lazy.nvim or manually loaded.

## Testing and Development

### Quick theme testing
```bash
./test-theme.sh
```
This script validates that the theme loads without errors in headless mode.

### Manual visual testing
```bash
nvim examples/demo.lua
```

### Test theme in running Neovim session
```vim
:lua require("orangevim").load()
```

### Switch between themes for comparison
```vim
:colorscheme orangevim
:colorscheme catppuccin  " or any other theme
```

## Architecture

### Module Structure

The codebase follows a modular Lua architecture:

1. **`colors/orangevim.lua`** - Entry point for Neovim's colorscheme system. Simply calls `require("orangevim").load()`

2. **`lua/orangevim/init.lua`** - Main module providing:
   - `load()` - Resets previous colorscheme and applies OrangeVim highlights and terminal colors
   - `setup(opts)` - Public API for plugin configuration (currently just calls `load()`, designed for future options)
   - Helper functions for setting terminal colors and applying highlight groups

3. **`lua/orangevim/colors.lua`** - Color palette definition with all hex values for:
   - Base colors (background, foreground)
   - Orange accent variants (primary, dimmed, hover)
   - Syntax colors (green, cyan, blue, magenta, etc.)
   - Git colors (add, change, delete)
   - Diagnostic colors (error, warning, info, hint)
   - Terminal colors (16 ANSI colors)

4. **`lua/orangevim/theme.lua`** - Returns a table of highlight group definitions by calling `c` from colors module. Includes:
   - Base Neovim highlights (Normal, Cursor, Visual, etc.)
   - Treesitter token highlights (prefixed with `@`)
   - LSP diagnostic highlights
   - Plugin-specific highlights (Telescope, NvimTree, GitSigns, BufferLine, WhichKey, Noice, Dashboard, Indent Blankline, Notify, Todo Comments)

5. **`plugin/orangevim.lua`** - Empty auto-load file that signals to Neovim this is a valid plugin

### Color Application Flow

1. User calls `:colorscheme orangevim` or `require("orangevim").setup()`
2. `init.lua:load()` resets any existing colorscheme and syntax
3. Enables `termguicolors` and sets `vim.g.colors_name = "orangevim"`
4. Loads highlight table from `theme.lua` (which imports `colors.lua`)
5. Applies all highlights via `vim.api.nvim_set_hl(0, group, settings)`
6. Sets terminal colors via `vim.g.terminal_color_*` globals

### Key Design Patterns

- **Orange as primary accent**: The `#ff7300` orange is used for selection, focus, borders, titles, and important UI elements
- **Modular color definitions**: All colors defined once in `colors.lua`, referenced throughout `theme.lua`
- **Plugin integration**: Extensive highlight definitions for popular Neovim plugins to ensure consistent theming
- **Treesitter-first**: Modern syntax highlighting via Treesitter with fallbacks to traditional syntax groups

## Installation Methods

The theme supports multiple installation approaches:

1. **As a plugin via lazy.nvim** (recommended for distribution):
```lua
{
  "antunesgabriel/orangevim",
  priority = 1000,
  config = function()
    require("orangevim").setup()
  end,
}
```

2. **Manual local installation**:
```bash
git clone https://github.com/antunesgabriel/orangevim ~/.config/nvim/orangevim
```
Then add to `init.lua`:
```lua
vim.opt.rtp:prepend("~/.config/nvim/orangevim")
vim.cmd.colorscheme("orangevim")
```

3. **Better Vim integration** (for local development):
Add to runtimepath in `~/.config/better-vim/better-vim.lua` and set theme in `config/theme.lua`

## File Organization

- `colors/` - Neovim colorscheme entry point
- `lua/orangevim/` - Core Lua modules (init, colors, theme)
- `plugin/` - Plugin auto-load marker
- `examples/` - Demo files for visual testing
- `test-theme.sh` - Automated headless test script
- `INSTALL.md` - Detailed installation instructions for various setups
- `README.md` - User-facing documentation with features and screenshots
