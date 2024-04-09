---@diagnostic disable: different-requires
local lspconfig = require "lspconfig"
local configs = require "nvchad.configs.lspconfig"

local capabilities = configs.capabilities
local on_attach = configs.on_attach
local on_init = configs.on_init

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
  "biome",
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
    on_init = on_init,
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end
