local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require("lspconfig")

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
      on_attach = attach,
      capabilities = capabilities,
    })
  end
end

return M
