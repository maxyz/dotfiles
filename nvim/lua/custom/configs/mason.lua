local M = {}

M.ensure_installed = {
  -- lua stuff
  "lua-language-server",
  "stylua",

  -- web dev
  "css-lsp",
  "html-lsp",
  "typescript-language-server",
  "deno",
  "eslint-lsp",
  "emmet-ls",
  "json-lsp",
  "prettierd",

  -- shell
  "shfmt",
  "shellcheck",

  -- ansible
  "ansible-language-server",

  -- awk
  "awk-language-server",

  -- python
  "black",
  "flake8",
  "pyright",
  "ruff",
  "ruff-lsp",

  -- C/C++
  "clangd",

  -- docker
  "dockerfile-language-server",

  -- flux (influx)
  "flux-lsp",

  -- markdown
  "markdownlint",

  -- rust
  "rust-analyzer",

  -- toml
  "taplo",

  -- yaml
  "yaml-language-server",
}

return M
