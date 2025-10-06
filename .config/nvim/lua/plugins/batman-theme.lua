-- ~/.config/nvim/colors/batman-minimal.lua
-- one-accent (yellow) + black/gray UI

vim.o.termguicolors = true

local P = {
  bg = "#0f0f0f",
  bg1 = "#141414",
  bg2 = "#1a1a1a",
  bg3 = "#1f1f1f",
  fg = "#d8d8d8",
  fg_dim = "#b3b3b3",
  gray = "#6b6b6b",
  border = "#2a2a2a",
  y = "#ffdd33", -- accent (yellow)
  y_dim = "#d4b830",
}

local function hi(g, spec)
  vim.api.nvim_set_hl(0, g, spec)
end

-- base
hi("Normal", { fg = P.fg, bg = P.bg })
hi("NormalNC", { fg = P.fg_dim, bg = P.bg })
hi("CursorLine", { bg = P.bg2 })
hi("CursorColumn", { bg = P.bg2 })
hi("LineNr", { fg = P.gray, bg = "NONE" })
hi("CursorLineNr", { fg = P.y, bg = "NONE", bold = true })
hi("SignColumn", { bg = P.bg })
hi("VertSplit", { fg = P.border })
hi("WinSeparator", { fg = P.border })
hi("ColorColumn", { bg = P.bg2 })
hi("EndOfBuffer", { fg = P.bg })
hi("NonText", { fg = P.gray })
hi("Whitespace", { fg = P.bg3 })

-- text
hi("Title", { fg = P.y, bold = true })
hi("Comment", { fg = P.gray, italic = true })
hi("String", { fg = P.fg }) -- no extra color
hi("Character", { fg = P.fg })
hi("Number", { fg = P.fg })
hi("Boolean", { fg = P.y, bold = true }) -- accent
hi("Float", { fg = P.fg })
hi("Identifier", { fg = P.fg })
hi("Function", { fg = P.fg, bold = true })
hi("Statement", { fg = P.fg })
hi("Conditional", { fg = P.y, bold = true }) -- accent
hi("Repeat", { fg = P.y })
hi("Label", { fg = P.y })
hi("Operator", { fg = P.fg })
hi("Keyword", { fg = P.y })
hi("Exception", { fg = P.y })
hi("PreProc", { fg = P.fg })
hi("Type", { fg = P.fg })
hi("Special", { fg = P.y })
hi("Directory", { fg = P.y })

-- search / select
hi("Search", { fg = P.bg, bg = P.y })
hi("IncSearch", { fg = P.bg, bg = P.y, reverse = true })
hi("Visual", { bg = P.bg3 })

-- status / popup
hi("Pmenu", { fg = P.fg, bg = P.bg2 })
hi("PmenuSel", { fg = P.bg, bg = P.y })
hi("PmenuSbar", { bg = P.bg2 })
hi("PmenuThumb", { bg = P.bg3 })
hi("StatusLine", { fg = P.fg, bg = P.bg2 })
hi("StatusLineNC", { fg = P.gray, bg = P.bg2 })
hi("WinBar", { fg = P.gray, bg = P.bg })
hi("WinBarNC", { fg = P.gray, bg = P.bg })

-- diagnostics (only yellow accent; others muted grayscale)
hi("DiagnosticWarn", { fg = P.y })
hi("DiagnosticInfo", { fg = P.gray })
hi("DiagnosticHint", { fg = P.gray })
hi("DiagnosticOk", { fg = P.fg })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = P.y })
hi("DiagnosticUnderlineError", { underline = true }) -- grayscale underline
hi("Error", { fg = P.fg, bg = P.bg }) -- keep neutral
hi("ErrorMsg", { fg = P.fg })
hi("WarningMsg", { fg = P.y })

-- diffs / git signs (no red/green; subtle + yellow change)
hi("DiffAdd", { bg = P.bg2 })
hi("DiffDelete", { bg = P.bg2 })
hi("DiffChange", { bg = P.bg2 })
hi("DiffText", { bg = P.bg3 })
hi("GitSignsAdd", { fg = P.gray })
hi("GitSignsDelete", { fg = P.gray })
hi("GitSignsChange", { fg = P.y })

-- telescope
hi("TelescopeBorder", { fg = P.border, bg = P.bg2 })
hi("TelescopePromptBorder", { fg = P.border, bg = P.bg2 })
hi("TelescopeTitle", { fg = P.y, bold = true })
hi("TelescopeSelection", { bg = P.bg3, fg = P.fg })
hi("TelescopeMatching", { fg = P.y, bold = true })

-- lsp
hi("FloatBorder", { fg = P.border, bg = P.bg2 })
hi("NormalFloat", { fg = P.fg, bg = P.bg2 })

-- treesitter: link to existing groups to avoid extra colors
vim.cmd([[
  hi! link @keyword        Keyword
  hi! link @boolean        Boolean
  hi! link @repeat         Repeat
  hi! link @conditional    Conditional
  hi! link @function       Function
  hi! link @variable       Identifier
  hi! link @string         String
  hi! link @type           Type
]])

-- terminal palette (helps `:terminal` match kitty)
vim.g.terminal_color_0 = P.bg
vim.g.terminal_color_7 = P.fg
vim.g.terminal_color_8 = P.gray
vim.g.terminal_color_11 = P.y -- yellow
for i, v in pairs({
  [1] = P.gray,
  [2] = P.gray,
  [3] = P.y,
  [4] = P.gray,
  [5] = P.gray,
  [6] = P.gray,
  [9] = P.gray,
  [10] = P.gray,
  [12] = P.gray,
  [13] = P.gray,
  [14] = P.gray,
}) do
  vim.g["terminal_color_" .. i] = v
end

-- finish
vim.g.colors_name = "batman-minimal"
