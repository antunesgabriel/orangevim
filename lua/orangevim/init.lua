local M = {}

local function set_terminal_colors()
  local c = require("orangevim.colors")

  vim.g.terminal_color_0 = c.term_black
  vim.g.terminal_color_1 = c.term_red
  vim.g.terminal_color_2 = c.term_green
  vim.g.terminal_color_3 = c.term_yellow
  vim.g.terminal_color_4 = c.term_blue
  vim.g.terminal_color_5 = c.term_magenta
  vim.g.terminal_color_6 = c.term_cyan
  vim.g.terminal_color_7 = c.term_white
  vim.g.terminal_color_8 = c.term_bright_black
  vim.g.terminal_color_9 = c.term_bright_red
  vim.g.terminal_color_10 = c.term_bright_green
  vim.g.terminal_color_11 = c.term_bright_yellow
  vim.g.terminal_color_12 = c.term_bright_blue
  vim.g.terminal_color_13 = c.term_bright_magenta
  vim.g.terminal_color_14 = c.term_bright_cyan
  vim.g.terminal_color_15 = c.term_bright_white
end

local function set_highlights(groups)
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

function M.load()
  -- Reset colors
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "orangevim"

  -- Load and apply theme
  local theme = require("orangevim.theme")
  local highlights = theme.setup()

  set_highlights(highlights)
  set_terminal_colors()
end

function M.setup(opts)
  opts = opts or {}
  -- Future: Add configuration options here
  -- For now, just load the theme
  M.load()
end

return M
