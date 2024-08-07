---@diagnostic disable: different-requires
local lspconfig = require "lspconfig"
local configs = require "nvchad.configs.lspconfig"

local capabilities = configs.capabilities
local on_attach = configs.on_attach
local on_init = configs.on_init

-- lspservers with default config
local servers = {
  -- Web
  html = {},
  cssls = {},
  eslint = {},
  emmet_ls = {},
  -- javascript and typescript
  -- "denols",
  tsserver = {},
  biome = {},
  -- Python
  pyright = {},
  ruff_lsp = {},
  -- Gleam
  gleam = {},
  -- Haskell
  hls = {},
  -- Rust
  rust_analyzer = {},
  -- C and friends
  clangd = {},
  -- purescript
  purescriptls = {
    settings = {
      purescript = {
        formatter = "purs-tidy",
      },
    },
  },
  -- lua
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  },
  -- Influx
  -- "flux_lsp",
  -- terraform
  terraformls = {},
  tflint = {},
  -- json
  jsonls = {},
  -- Markdown
  marksman = {}, -- too slow?
  -- toml
  taplo = {},
}

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

for lsp, opts in pairs(servers) do
  opts.on_init = on_init
  opts.on_attach = custom_on_attach
  opts.capabilities = capabilities

  lspconfig[lsp].setup(opts)
end
