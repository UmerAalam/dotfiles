-- batman-tritone: only Yellow + Black + Gray (with shades)
-- Save as: ~/.config/nvim/colors/batman-tritone.lua

vim.o.termguicolors = true
vim.g.colors_name = "batman-tritone"

-- ── Palette (only 3 colors, with shades) ──────────────────────────────────────
local Y = "#f7d23e" -- main yellow
local Y2 = "#e6c234" -- dim yellow
local Y3 = "#caa72a" -- deeper yellow (selection / emphasis)

local B0 = "#0b0b0b" -- true black-ish background
local B1 = "#111111" -- cursorline / panel
local B2 = "#171717" -- popup / pmenu
local B3 = "#1e1e1e" -- selection / float

local G0 = "#8f8f8f" -- base gray (text weak / comments)
local G1 = "#bfbfbf" -- foreground (main text)
local G2 = "#6f6f6f" -- line numbers / subtle
local GB = "#2a2a2a" -- borders / splits

local function hi(g, s)
  vim.api.nvim_set_hl(0, g, s)
end

-- ── Core UI ───────────────────────────────────────────────────────────────────
hi("Normal", { fg = G1, bg = B0 })
hi("NormalNC", { fg = G1, bg = B0 })
hi("EndOfBuffer", { fg = B0, bg = B0 })
hi("LineNr", { fg = G2, bg = "NONE" })
hi("CursorLineNr", { fg = Y, bg = "NONE", bold = true })
hi("CursorLine", { bg = B1 })
hi("CursorColumn", { bg = B1 })
hi("SignColumn", { bg = B0 })
hi("VertSplit", { fg = GB, bg = B0 })
hi("WinSeparator", { fg = GB, bg = B0 })
hi("ColorColumn", { bg = B1 })
hi("Whitespace", { fg = B1 })
hi("NonText", { fg = G2 })

hi("Title", { fg = Y, bold = true })
hi("Directory", { fg = Y })
hi("MatchParen", { fg = B0, bg = Y, bold = true })

-- ── Text groups (no extra hues) ───────────────────────────────────────────────
hi("Comment", { fg = G2, italic = true })
hi("Conceal", { fg = G2 })
hi("Identifier", { fg = G1 })
hi("Function", { fg = G1, bold = true })
hi("Statement", { fg = G1 })
hi("Operator", { fg = G1 })
hi("Keyword", { fg = Y })
hi("Conditional", { fg = Y, bold = true })
hi("Repeat", { fg = Y })
hi("Label", { fg = Y })
hi("Exception", { fg = Y })
hi("PreProc", { fg = G1 })
hi("Type", { fg = G1, bold = true })
hi("String", { fg = G1 })
hi("Number", { fg = G1 })
hi("Boolean", { fg = Y, bold = true })
hi("Float", { fg = G1 })
hi("Special", { fg = Y })

-- ── Selection / Search ────────────────────────────────────────────────────────
hi("Visual", { bg = B3 })
hi("Search", { fg = B0, bg = Y })
hi("IncSearch", { fg = B0, bg = Y3 })
hi("CurSearch", { fg = B0, bg = Y3, bold = true })

-- ── Popup / Menus / Status ────────────────────────────────────────────────────
hi("Pmenu", { fg = G1, bg = B2 })
hi("PmenuSel", { fg = B0, bg = Y })
hi("PmenuSbar", { bg = B2 })
hi("PmenuThumb", { bg = B3 })
hi("StatusLine", { fg = G1, bg = B1 })
hi("StatusLineNC", { fg = G0, bg = B1 })
hi("WinBar", { fg = G0, bg = B0 })
hi("WinBarNC", { fg = G0, bg = B0 })
hi("TabLine", { fg = G0, bg = B1 })
hi("TabLineSel", { fg = B0, bg = Y, bold = true })
hi("TabLineFill", { bg = B1 })

-- ── Diagnostics (only yellow + gray) ─────────────────────────────────────────
hi("DiagnosticError", { fg = G1 }) -- no red
hi("DiagnosticWarn", { fg = Y })
hi("DiagnosticInfo", { fg = G0 })
hi("DiagnosticHint", { fg = G0 })
hi("DiagnosticOk", { fg = G1 })
hi("DiagnosticUnderlineError", { underline = true })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = Y })
hi("DiagnosticUnderlineInfo", { underline = true })
hi("DiagnosticUnderlineHint", { underline = true })
hi("ErrorMsg", { fg = G1 })
hi("WarningMsg", { fg = Y })

-- ── Diff / Git (monochrome with yellow for change) ───────────────────────────
hi("DiffAdd", { bg = B1 })
hi("DiffDelete", { bg = B1 })
hi("DiffChange", { bg = B1 })
hi("DiffText", { bg = B3 })
hi("GitSignsAdd", { fg = G2 })
hi("GitSignsDelete", { fg = G2 })
hi("GitSignsChange", { fg = Y })

-- ── LSP / Floats ─────────────────────────────────────────────────────────────
hi("NormalFloat", { fg = G1, bg = B2 })
hi("FloatBorder", { fg = GB, bg = B2 })
hi("FloatTitle", { fg = Y, bg = B2, bold = true })

-- ── Telescope ────────────────────────────────────────────────────────────────
hi("TelescopeBorder", { fg = GB, bg = B2 })
hi("TelescopePromptBorder", { fg = GB, bg = B2 })
hi("TelescopeResultsBorder", { fg = GB, bg = B2 })
hi("TelescopePreviewBorder", { fg = GB, bg = B2 })
hi("TelescopeTitle", { fg = Y, bold = true })
hi("TelescopeSelection", { fg = G1, bg = B3 })
hi("TelescopeMatching", { fg = Y, bold = true })

-- ── nvim-cmp ─────────────────────────────────────────────────────────────────
hi("CmpItemAbbr", { fg = G1 })
hi("CmpItemAbbrDeprecated", { fg = G2, strikethrough = true })
hi("CmpItemAbbrMatch", { fg = Y, bold = true })
hi("CmpItemMenu", { fg = G0 })
hi("CmpItemKind", { fg = G0 })

-- ── Treesitter links (keep to our 3 colors) ──────────────────────────────────
vim.cmd([[
  hi! link @keyword         Keyword
  hi! link @keyword.return  Keyword
  hi! link @boolean         Boolean
  hi! link @repeat          Repeat
  hi! link @conditional     Conditional
  hi! link @function        Function
  hi! link @method          Function
  hi! link @variable        Identifier
  hi! link @field           Identifier
  hi! link @property        Identifier
  hi! link @string          String
  hi! link @character       String
  hi! link @number          Number
  hi! link @float           Float
  hi! link @type            Type
  hi! link @type.builtin    Type
  hi! link @operator        Operator
]])

-- ── Terminal palette (keeps :terminal within 3 colors) ───────────────────────
vim.g.terminal_color_0 = B0
vim.g.terminal_color_7 = G1
vim.g.terminal_color_8 = G2
vim.g.terminal_color_11 = Y
for i, v in pairs({
  [1] = G2,
  [2] = G2,
  [3] = Y,
  [4] = G2,
  [5] = G2,
  [6] = G2,
  [9] = G2,
  [10] = G2,
  [12] = G2,
  [13] = G2,
  [14] = G2,
}) do
  vim.g["terminal_color_" .. i] = v
end
