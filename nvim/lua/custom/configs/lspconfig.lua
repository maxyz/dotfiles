local lspconfig = require("lspconfig")

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- lspservers with default config
local servers = {
  -- Web
  "html",
  "cssls",
  "eslint",
  -- json
  "jsonls",
  -- Python
  "pyright",
  -- Rust
  "rust_analyzer",
  -- C and friends
  "clangd",
  -- lua
  -- "sumneko_lua",
  -- Influx
  "flux_lsp",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
