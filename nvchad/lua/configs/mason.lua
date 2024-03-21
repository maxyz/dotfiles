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
  "emmet-language-server",
  "json-lsp",
  "prettierd",
  "biome",

  -- shell
  "shfmt",
  "shellcheck",
  "bash-language-server",

  -- ansible
  "ansible-language-server",

  -- awk
  "awk-language-server",

  -- python
  -- "black",
  -- "flake8",
  "basedpyright",
  "ruff",
  "ruff-lsp",

  -- C/C++
  "clangd",
  "clang-format",

  -- docker
  "dockerfile-language-server",

  -- flux (influx)
  -- "flux-lsp",
  -- haskell
  "haskell-language-server",
  "fourmolu",

  -- markdown
  "marksman",

  -- rust
  "rust-analyzer",

  -- toml
  "taplo",

  -- yaml
  "yaml-language-server",
  "yamlfmt",
}

return M
