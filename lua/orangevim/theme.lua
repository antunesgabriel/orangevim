local c = require("orangevim.colors")

local M = {}

M.setup = function()
  local theme = {
    -- Base highlights
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg_dark },
    FloatBorder = { fg = c.orange, bg = c.bg_dark },
    FloatTitle = { fg = c.orange, bg = c.bg_dark, bold = true },

    -- Cursor
    Cursor = { fg = c.bg, bg = c.orange },
    lCursor = { fg = c.bg, bg = c.orange },
    CursorLine = { bg = c.bg_highlight },
    CursorLineNr = { fg = c.orange, bold = true },
    LineNr = { fg = c.fg_gutter },

    -- Visual
    Visual = { bg = c.bg_visual },
    VisualNOS = { bg = c.bg_visual },

    -- Search
    Search = { fg = c.bg, bg = c.orange },
    IncSearch = { fg = c.bg, bg = c.orange },
    CurSearch = { fg = c.bg, bg = c.orange },

    -- Folds
    Folded = { fg = c.gray, bg = c.bg_dark },
    FoldColumn = { fg = c.fg_gutter, bg = c.bg },

    -- Diffs
    DiffAdd = { fg = c.git_add, bg = c.none },
    DiffChange = { fg = c.git_change, bg = c.none },
    DiffDelete = { fg = c.git_delete, bg = c.none },
    DiffText = { fg = c.bg, bg = c.git_change },

    -- Popup menu
    Pmenu = { fg = c.fg, bg = c.bg_dark },
    PmenuSel = { fg = c.bg, bg = c.orange },
    PmenuSbar = { bg = c.bg_highlight },
    PmenuThumb = { bg = c.orange },

    -- Statusline
    StatusLine = { fg = c.fg, bg = c.bg_dark },
    StatusLineNC = { fg = c.fg_dark, bg = c.bg_dark },

    -- Tabline
    TabLine = { fg = c.fg_dark, bg = c.bg_dark },
    TabLineFill = { bg = c.bg_dark },
    TabLineSel = { fg = c.orange, bg = c.bg, bold = true },

    -- Window
    WinSeparator = { fg = c.gray_dark },
    VertSplit = { fg = c.gray_dark },

    -- Syntax highlighting
    Comment = { fg = c.gray, italic = true },
    Constant = { fg = c.red },
    String = { fg = c.green },
    Character = { fg = c.green },
    Number = { fg = c.red },
    Boolean = { fg = c.red },
    Float = { fg = c.red },

    Identifier = { fg = c.fg },
    Function = { fg = c.blue },

    Statement = { fg = c.magenta },
    Conditional = { fg = c.magenta },
    Repeat = { fg = c.magenta },
    Label = { fg = c.magenta },
    Operator = { fg = c.red },
    Keyword = { fg = c.magenta },
    Exception = { fg = c.magenta },

    PreProc = { fg = c.magenta },
    Include = { fg = c.magenta },
    Define = { fg = c.magenta },
    Macro = { fg = c.magenta },
    PreCondit = { fg = c.magenta },

    Type = { fg = c.yellow },
    StorageClass = { fg = c.magenta },
    Structure = { fg = c.yellow },
    Typedef = { fg = c.yellow },

    Special = { fg = c.cyan },
    SpecialChar = { fg = c.cyan },
    Tag = { fg = c.coral },
    Delimiter = { fg = c.fg },
    SpecialComment = { fg = c.gray },
    Debug = { fg = c.orange },

    Underlined = { underline = true },
    Ignore = { fg = c.gray_dark },
    Error = { fg = c.error },
    Todo = { fg = c.orange, bold = true },

    -- Treesitter
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.red },
    ["@variable.parameter"] = { fg = c.fg },
    ["@variable.member"] = { fg = c.cyan },

    ["@constant"] = { fg = c.red },
    ["@constant.builtin"] = { fg = c.red },
    ["@constant.macro"] = { fg = c.red },

    ["@string"] = { fg = c.green },
    ["@string.escape"] = { fg = c.cyan },
    ["@string.regex"] = { fg = c.cyan },

    ["@character"] = { fg = c.green },
    ["@number"] = { fg = c.red },
    ["@boolean"] = { fg = c.red },
    ["@float"] = { fg = c.red },

    ["@function"] = { fg = c.blue },
    ["@function.builtin"] = { fg = c.blue },
    ["@function.macro"] = { fg = c.magenta },
    ["@function.call"] = { fg = c.blue },

    ["@method"] = { fg = c.blue },
    ["@method.call"] = { fg = c.blue },

    ["@constructor"] = { fg = c.yellow },
    ["@parameter"] = { fg = c.fg },

    ["@keyword"] = { fg = c.magenta },
    ["@keyword.function"] = { fg = c.magenta },
    ["@keyword.operator"] = { fg = c.magenta },
    ["@keyword.return"] = { fg = c.magenta },

    ["@conditional"] = { fg = c.magenta },
    ["@repeat"] = { fg = c.magenta },
    ["@label"] = { fg = c.magenta },
    ["@operator"] = { fg = c.red },
    ["@exception"] = { fg = c.magenta },

    ["@type"] = { fg = c.yellow },
    ["@type.builtin"] = { fg = c.yellow },
    ["@type.qualifier"] = { fg = c.magenta },

    ["@property"] = { fg = c.cyan },
    ["@field"] = { fg = c.cyan },

    ["@tag"] = { fg = c.coral },
    ["@tag.attribute"] = { fg = c.magenta },
    ["@tag.delimiter"] = { fg = c.fg },

    ["@namespace"] = { fg = c.yellow },
    ["@punctuation.delimiter"] = { fg = c.fg },
    ["@punctuation.bracket"] = { fg = c.fg },
    ["@punctuation.special"] = { fg = c.orange },

    ["@comment"] = { fg = c.gray, italic = true },
    ["@text.uri"] = { fg = c.orange, underline = true },
    ["@text.title"] = { fg = c.orange, bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.strong"] = { bold = true },

    -- LSP
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticInfo = { fg = c.info },
    DiagnosticHint = { fg = c.hint },

    DiagnosticUnderlineError = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },

    LspReferenceText = { bg = c.bg_visual },
    LspReferenceRead = { bg = c.bg_visual },
    LspReferenceWrite = { bg = c.bg_visual },

    -- Telescope
    TelescopeNormal = { fg = c.fg, bg = c.bg_dark },
    TelescopeBorder = { fg = c.orange, bg = c.bg_dark },
    TelescopeTitle = { fg = c.orange, bg = c.bg_dark, bold = true },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg_dark },
    TelescopePromptBorder = { fg = c.orange, bg = c.bg_dark },
    TelescopePromptTitle = { fg = c.bg, bg = c.orange, bold = true },
    TelescopePromptPrefix = { fg = c.orange },
    TelescopeSelection = { fg = c.fg, bg = c.bg_highlight, bold = true },
    TelescopeSelectionCaret = { fg = c.orange },
    TelescopeMatching = { fg = c.orange, bold = true },
    TelescopePreviewTitle = { fg = c.orange, bg = c.bg_dark, bold = true },
    TelescopeResultsTitle = { fg = c.orange, bg = c.bg_dark, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg, bg = c.bg },
    NvimTreeNormalNC = { fg = c.fg, bg = c.bg },
    NvimTreeRootFolder = { fg = c.orange, bold = true },
    NvimTreeFolderName = { fg = c.blue },
    NvimTreeFolderIcon = { fg = c.orange },
    NvimTreeEmptyFolderName = { fg = c.gray },
    NvimTreeOpenedFolderName = { fg = c.blue, bold = true },
    NvimTreeSymlink = { fg = c.cyan },
    NvimTreeExecFile = { fg = c.green },
    NvimTreeOpenedFile = { fg = c.orange },
    NvimTreeSpecialFile = { fg = c.magenta },
    NvimTreeImageFile = { fg = c.magenta },
    NvimTreeIndentMarker = { fg = c.gray_dark },
    NvimTreeGitDirty = { fg = c.git_change },
    NvimTreeGitStaged = { fg = c.git_add },
    NvimTreeGitMerge = { fg = c.git_change },
    NvimTreeGitRenamed = { fg = c.git_change },
    NvimTreeGitNew = { fg = c.git_add },
    NvimTreeGitDeleted = { fg = c.git_delete },
    NvimTreeWindowPicker = { fg = c.bg, bg = c.orange, bold = true },

    -- GitSigns
    GitSignsAdd = { fg = c.git_add },
    GitSignsChange = { fg = c.git_change },
    GitSignsDelete = { fg = c.git_delete },
    GitSignsCurrentLineBlame = { fg = c.gray, italic = true },

    -- BufferLine
    BufferLineFill = { bg = c.bg_dark },
    BufferLineBackground = { fg = c.fg_dark, bg = c.bg_dark },
    BufferLineBufferSelected = { fg = c.orange, bg = c.bg, bold = true },
    BufferLineBufferVisible = { fg = c.fg, bg = c.bg_dark },
    BufferLineIndicatorSelected = { fg = c.orange, bg = c.bg },
    BufferLineModified = { fg = c.git_change, bg = c.bg_dark },
    BufferLineModifiedSelected = { fg = c.git_change, bg = c.bg },

    -- WhichKey
    WhichKey = { fg = c.orange },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeparator = { fg = c.gray },
    WhichKeyFloat = { bg = c.bg_dark },
    WhichKeyBorder = { fg = c.orange, bg = c.bg_dark },

    -- Noice
    NoicePopup = { fg = c.fg, bg = c.bg_dark },
    NoicePopupBorder = { fg = c.orange, bg = c.bg_dark },
    NoiceCmdlinePopup = { fg = c.fg, bg = c.bg_dark },
    NoiceCmdlinePopupBorder = { fg = c.orange, bg = c.bg_dark },
    NoiceCmdlineIcon = { fg = c.orange },

    -- Dashboard
    DashboardHeader = { fg = c.orange },
    DashboardFooter = { fg = c.gray, italic = true },
    DashboardCenter = { fg = c.blue },
    DashboardShortcut = { fg = c.magenta },

    -- Indent Blankline
    IndentBlanklineChar = { fg = c.gray_dark },
    IndentBlanklineContextChar = { fg = c.orange },

    -- Notify
    NotifyBackground = { bg = c.bg_dark },
    NotifyERRORBorder = { fg = c.error, bg = c.bg_dark },
    NotifyWARNBorder = { fg = c.warning, bg = c.bg_dark },
    NotifyINFOBorder = { fg = c.info, bg = c.bg_dark },
    NotifyDEBUGBorder = { fg = c.hint, bg = c.bg_dark },
    NotifyTRACEBorder = { fg = c.magenta, bg = c.bg_dark },
    NotifyERRORIcon = { fg = c.error },
    NotifyWARNIcon = { fg = c.warning },
    NotifyINFOIcon = { fg = c.info },
    NotifyDEBUGIcon = { fg = c.hint },
    NotifyTRACEIcon = { fg = c.magenta },
    NotifyERRORTitle = { fg = c.error },
    NotifyWARNTitle = { fg = c.warning },
    NotifyINFOTitle = { fg = c.info },
    NotifyDEBUGTitle = { fg = c.hint },
    NotifyTRACETitle = { fg = c.magenta },

    -- Todo Comments
    TodoFgTODO = { fg = c.bg, bg = c.orange },
    TodoBgTODO = { fg = c.orange },
    TodoSignTODO = { fg = c.orange },
    TodoFgFIX = { fg = c.bg, bg = c.error },
    TodoBgFIX = { fg = c.error },
    TodoSignFIX = { fg = c.error },
    TodoFgWARN = { fg = c.bg, bg = c.warning },
    TodoBgWARN = { fg = c.warning },
    TodoSignWARN = { fg = c.warning },
    TodoFgNOTE = { fg = c.bg, bg = c.info },
    TodoBgNOTE = { fg = c.info },
    TodoSignNOTE = { fg = c.info },
  }

  return theme
end

return M
