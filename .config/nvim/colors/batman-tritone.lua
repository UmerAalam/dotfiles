-- ~/.config/nvim/colors/batman-tritone.lua
-- batman-tritone: Yellow + Black + Gray (with optional blue accents)

vim.o.termguicolors = true
vim.g.colors_name = "batman-tritone"
vim.o.background = "dark"

-- Reset so our highlights win
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

-- ── Palette ──────────────────────────────────────────────────────────────────
local Y = "#f7d23e" -- main yellow
local Y2 = "#e6c234" -- dim yellow
local Y3 = "#caa72a" -- deeper yellow (selection / emphasis)

local B0 = "#0b0b0b" -- true black-ish background
local B1 = "#111111" -- cursorline / panel
local B2 = "#171717" -- popup / pmenu
local B3 = "#1e1e1e" -- selection / float

-- Blue accents
local C0 = "#5fa8ff" -- blue for keywords / attributes
local A0 = "#ef233c" -- current function color (keep as you had)

local G0 = "#8f8f8f" -- weak text / comments
local G1 = "#bfbfbf" -- main foreground
local G2 = "#6f6f6f" -- subtle / line numbers
local GB = "#2a2a2a" -- borders

local function hi(g, s)
  vim.api.nvim_set_hl(0, g, s)
end

-- ── Core UI ───────────────────────────────────────────────────────────────────
hi("Normal", { fg = G1, bg = B0 })
hi("NormalNC", { fg = G1, bg = B0 })
hi("EndOfBuffer", { fg = B0, bg = B0 })
hi("LineNr", { fg = G2 })
hi("CursorLineNr", { fg = Y, bold = true })
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

-- ── Imports / Modules ─────────────────────────────────────────────────────────
hi("@keyword.import", { fg = C0, bold = true }) -- "import", "from"
hi("@include", { fg = C0 }) -- fallback for Lua/C/C++
hi("@namespace", { fg = C0 }) -- e.g. "React" in "import React from ..."
hi("@module", { fg = C0 }) -- e.g. the module name

-- ── Text groups ───────────────────────────────────────────────────────────────
hi("Comment", { fg = G2, italic = true })
hi("Conceal", { fg = G2 })
hi("Identifier", { fg = G1 })
hi("Function", { fg = A0, bold = true })
hi("Keyword", { fg = C0 })
hi("Statement", { fg = G1 })
hi("Operator", { fg = G1 })
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

-- ── Diagnostics ───────────────────────────────────────────────────────────────
hi("DiagnosticError", { fg = G1 })
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

-- Make module paths blue (works with newer queries)
hi("@string.special.path", { fg = C0 })
hi("@string.uri", { fg = C0 }) -- fallback for older queries
hi("@string.url", { fg = C0 }) -- another common alias

-- Make imported identifiers / namespaces blue
hi("@namespace", { fg = C0 })
hi("@module", { fg = C0 })
hi("@variable", { fg = G1 }) -- keep other vars neutral

-- ── Diff / Git ────────────────────────────────────────────────────────────────
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

-- ── Tags & Attributes (Treesitter + LSP) ─────────────────────────────────────
-- Tags yellow; attributes blue
hi("@tag", { fg = Y, bold = true })
hi("@tag.delimiter", { fg = Y2 })
hi("@tag.attribute", { fg = C0, bold = true }) -- onClick, className, etc.

--Imports
vim.cmd([[
  hi! link @lsp.type.namespace  @namespace
  hi! link @lsp.type.module     @namespace
  hi! link @lsp.type.parameter  Identifier
]])
-- Language-specific Treesitter links (cover html/jsx/tsx variants)
vim.cmd([[
  " TSX
  hi! link @tag.tsx             @tag
  hi! link @tag.delimiter.tsx   @tag.delimiter
  hi! link @tag.attribute.tsx   @tag.attribute

  " JSX
  hi! link @tag.jsx             @tag
  hi! link @tag.delimiter.jsx   @tag.delimiter
  hi! link @tag.attribute.jsx   @tag.attribute

  " HTML
  hi! link @tag.html            @tag
  hi! link @tag.delimiter.html  @tag.delimiter
  hi! link @tag.attribute.html  @tag.attribute
]])

-- Generic Treesitter links (rest of your minimal scheme)
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

-- LSP semantic tokens (so LSP can't override our colors)
vim.cmd([[
  hi! link @lsp.type.tag                   @tag
  hi! link @lsp.type.attribute             @tag.attribute
  hi! link @lsp.type.property              @tag.attribute
  hi! link @lsp.typemod.property.readonly  @tag.attribute
  hi! link @lsp.type.keyword               Keyword
  hi! link @lsp.type.type                  Type
  hi! link @lsp.type.function              Function
]])

-- ── Terminal palette ─────────────────────────────────────────────────────────
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

-- ── (Optional) Devicons: make .ts / .tsx icons blue ──────────────────────────
-- Put this here so it runs after the colorscheme is loaded.
pcall(function()
  local devicons = require("nvim-web-devicons")
  devicons.set_icon({
    ts = { icon = "", color = C0, name = "Ts" },
    tsx = { icon = "", color = C0, name = "Tsx" },
  })
  -- Some explorers reference these highlight groups directly
  hi("DevIconTs", { fg = C0 })
  hi("DevIconTsx", { fg = C0 })
end)
