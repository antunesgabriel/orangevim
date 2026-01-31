#!/bin/bash
# Quick test script for OrangeVim theme

echo "🍊 Testing OrangeVim Theme..."
echo ""

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim is not installed"
    exit 1
fi

echo "✅ Neovim found"

# Test loading the theme in Neovim
nvim --headless \
    --cmd "set rtp+=$HOME/.config/better-vim/custom/orangevim" \
    --cmd "lua require('orangevim').load()" \
    --cmd "lua print('Theme loaded successfully!')" \
    --cmd "qa" 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Theme loads without errors"
    echo ""
    echo "To test visually, run:"
    echo "  nvim examples/demo.lua"
    echo ""
    echo "Or activate in Better Vim by editing config/theme.lua:"
    echo "  name = 'orangevim'"
else
    echo "❌ Theme failed to load"
    exit 1
fi
