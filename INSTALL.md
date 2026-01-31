# Installation Guide for OrangeVim

## Quick Setup in Better Vim (Testing Locally)

### Option 1: Direct in Better Vim (Current Setup)

1. **Add to runtimepath** - Edit `~/.config/better-vim/better-vim.lua`:

```lua
-- Add this at the very top of the file, before the requires
vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/custom/orangevim")

-- Then your normal config
local plugins = require("better-vim.config.plugins")
-- ... rest of file
```

2. **Set the theme** - Edit `~/.config/better-vim/config/theme.lua`:

```lua
return {
  name = "orangevim"
}
```

3. **Restart Neovim**

```bash
nvim
```

### Option 2: As a Plugin in Better Vim

1. **Add to plugins** - Edit `~/.config/better-vim/config/plugins.lua`:

```lua
return {
  -- ... other plugins
  {
    dir = vim.fn.stdpath("config") .. "/custom/orangevim",
    name = "orangevim",
    lazy = false,
    priority = 1000,
    config = function()
      require("orangevim").setup()
    end,
  },
  -- ... rest of plugins
}
```

2. **Set the theme** in `config/theme.lua`:

```lua
return {
  name = "orangevim"
}
```

3. **Sync plugins** in Neovim:

```vim
:Lazy sync
```

4. **Restart Neovim**

## When You Publish as a Repository

### Create the Repository

1. **Copy to new directory**:

```bash
mkdir -p ~/projects/orangevim.nvim
cp -r ~/.config/better-vim/custom/orangevim/* ~/projects/orangevim.nvim/
cd ~/projects/orangevim.nvim
git init
git add .
git commit -m "Initial commit: OrangeVim theme"
```

2. **Push to GitHub**:

```bash
gh repo create orangevim.nvim --public
git remote add origin https://github.com/yourusername/orangevim.nvim.git
git push -u origin main
```

### Install from GitHub

Edit `~/.config/better-vim/config/plugins.lua`:

```lua
return {
  -- ... other plugins
  {
    "yourusername/orangevim.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("orangevim").setup()
    end,
  },
  -- ... rest of plugins
}
```

## Testing the Theme

### Test immediately without restart

```vim
:lua require("orangevim").load()
```

### Switch back to previous theme

```vim
:colorscheme catppuccin
```

### Toggle between themes

```vim
:colorscheme orangevim
:colorscheme catppuccin
```

## Customization (Future)

The theme is designed to be extensible. Future options might include:

```lua
require("orangevim").setup({
  -- Customize specific colors
  colors = {
    orange = "#ff8800", -- Custom orange
  },

  -- Override specific highlight groups
  overrides = {
    Comment = { fg = "#aaaaaa", italic = false },
  },

  -- Enable/disable features
  terminal_colors = true,
  transparent_background = false,
})
```

## Troubleshooting

### Theme not loading

1. Check if the path is in runtimepath:
```vim
:set rtp?
```

2. Verify the theme file exists:
```vim
:echo globpath(&rtp, 'colors/orangevim.lua')
```

3. Check for errors:
```vim
:messages
```

### Colors look wrong

1. Ensure true color support is enabled:
```vim
:set termguicolors?
```

Should show `termguicolors` (not `notermguicolors`)

2. Check terminal emulator support for true colors

### Plugin highlights missing

Some plugins may need to be reloaded after changing themes. Try:

```vim
:e
```

Or restart Neovim completely.
