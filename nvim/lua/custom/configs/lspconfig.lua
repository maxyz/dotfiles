local lspconfig = require "lspconfig"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- lspservers with default config
local servers = {
  -- Web
  "html",
  "cssls",
  "eslint",
  "emmet_ls",
  -- javascript and typescript
  -- "denols",
  "tsserver",
  -- Python
  "pyright",
  "ruff_lsp",
  -- Haskell
  "hls",
  -- Rust
  "rust_analyzer",
  -- C and friends
  "clangd",
  -- lua
  -- "sumneko_lua",
  -- Influx
  -- "flux_lsp",
  -- terraform
  "terraformls",
  "tflint",
  -- json
  "jsonls",
  -- Markdown
  "marksman",
  -- toml
  "taplo",
}

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end
