-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     inlay_hints = { enabled = false },
--   },
-- }
-- lsp.lua
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "omnisharp" }, -- unity-friendly
})

local lspconfig = require("lspconfig")
local caps = require("cmp_nvim_lsp").default_capabilities()

-- Use the modern .NET build of OmniSharp (works great on Linux)
lspconfig.omnisharp.setup({
  capabilities = caps,
  -- If you have dotnet installed, this is usually enough:
  -- use_mono = false is the default in recent builds, but set explicitly:
  enable_editorconfig_support = true,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
})

-- completion (super minimal)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
})
