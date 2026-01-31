# 🍊 OrangeVim

A dark Neovim colorscheme with vibrant orange accents, inspired by the [Dark Orange VSCode theme](https://github.com/jb3rndt/dark-orange).

![Theme Preview](https://img.shields.io/badge/theme-orangevim-ff7300?style=for-the-badge)

## ✨ Features

- 🎨 Rich syntax highlighting with carefully chosen colors
- 🔍 Full support for Telescope
- 📁 Beautiful nvim-tree integration
- 🌳 Treesitter support
- 🔧 LSP diagnostics highlighting
- 📊 Git signs integration
- 🎯 Support for popular plugins (BufferLine, WhichKey, Noice, Todo Comments, etc.)
- 💻 Terminal colors configured

## 🎨 Color Palette

- **Background**: `#24292e` (dark charcoal)
- **Foreground**: `#e1e4e8` (light gray)
- **Primary Accent**: `#ff7300` (bright orange)
- **Strings**: `#98C379` (green)
- **Keywords**: `#C792EA` (magenta)
- **Functions**: `#82AAFF` (light blue)
- **Numbers**: `#FF5370` (red-pink)
- **Comments**: `#ABB2BF` (gray)

## 📦 Installation

### For Better Vim

Add to your `~/.config/better-vim/better-vim.lua`:

```lua
-- Add the theme to your Neovim runtimepath
vim.opt.rtp:prepend("~/.config/better-vim/custom/orangevim")

return {
  -- ... other config
  theme = {
    name = "orangevim"
  }
}
```

Or in `config/theme.lua`:

```lua
return {
  name = "orangevim"
}
```

### Using lazy.nvim (when you make it a plugin)

```lua
{
  "antunesgabriel/orangevim.nvim",
  priority = 1000,
  config = function()
    require("orangevim").setup()
  end,
}
```

### Manual Installation

```bash
git clone https://github.com/antunesgabriel/orangevim.nvim ~/.config/nvim/orangevim
```

Then in your `init.lua`:

```lua
vim.opt.rtp:prepend("~/.config/nvim/orangevim")
vim.cmd.colorscheme("orangevim")
```

## 🚀 Usage

### Load the colorscheme

```vim
:colorscheme orangevim
```

Or in Lua:

```lua
require("orangevim").load()
```

### With configuration (future)

```lua
require("orangevim").setup({
  -- Configuration options will go here
})
```

## 🔌 Plugin Support

OrangeVim includes custom highlighting for:

- **Telescope** - Search and fuzzy finder
- **nvim-tree** - File explorer
- **Treesitter** - Syntax highlighting
- **LSP** - Language server diagnostics
- **GitSigns** - Git integration
- **BufferLine** - Buffer/tab line
- **WhichKey** - Keybinding helper
- **Noice** - UI replacement
- **Todo Comments** - Comment highlighting
- **Indent Blankline** - Indentation guides
- **Notify** - Notification system
- **Dashboard** - Start screen

## 📸 Screenshots

> Add screenshots here when you publish the theme

## 🤝 Contributing

Contributions are welcome! Feel free to:

- Report bugs
- Suggest new features
- Submit pull requests
- Improve documentation

## 📄 License

MIT License - feel free to use and modify!

## 🙏 Credits

Inspired by the [Dark Orange VSCode theme](https://github.com/jb3rndt/dark-orange) by jb3rndt.

---

**Enjoy coding with OrangeVim! 🍊✨**
