local M = {}

-- Path to overriding theme and highlights files
M.ui = {
  statusline = {
    order = { "mode", "file", "git", "%=", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    theme = "minimal",
  },
}

M.base46 = {
  theme = "tokyodark",
  theme_toggle = { "tokyodark", "one_light" },
  -- transparency = true,

  hl_override = {
    Comment = { fg = "orange" },
    ["@comment"] = { fg = "orange" },
    NvimTreeOpenedFolderName = { fg = "green" },
    ["@annotation"] = { fg = "#31748f" },
    ["@punctuation.bracket"] = { fg = "#31748f" },
    ["@punctuation.delimiter"] = { fg = "#31748f" },
    ["@tag.delimiter"] = { fg = "#31748f" },
    ["@text.strike"] = { fg = "#31748f", strikethrough = true },
    integrations = { "markview" },
  },

  hl_add = {},
}

M.term = {
  base46_colors = true,
}

-- M.mason = {
--   pkgs = {
--     -- lua stuff
--     "lua-language-server",
--     "stylua",
--
--     -- web dev
--     "css-lsp",
--     "html-lsp",
--     "typescript-language-server",
--     "deno",
--     "eslint-lsp",
--     "emmet-language-server",
--     "json-lsp",
--     "prettierd",
--     "biome",
--
--     -- shell
--     "shfmt",
--     "shellcheck",
--     "bash-language-server",
--
--     -- ansible
--     "ansible-language-server",
--
--     -- awk
--     "awk-language-server",
--     -- java
--     "java-language-server",
--
--     -- python
--     -- "black",
--     -- "flake8",
--     "pyright",
--     "ruff",
--     "ruff-lsp",
--
--     -- C/C++
--     "clangd",
--     "clang-format",
--
--     -- docker
--     "dockerfile-language-server",
--
--     -- flux (influx)
--     -- "flux-lsp",
--     -- haskell
--     "haskell-language-server",
--     "fourmolu",
--
--     -- markdown
--     -- "marksman", -- too slow?
--
--     --purescript
--     "purescript-language-server",
--     "purescript-tidy",
--
--     -- rust
--     "rust-analyzer",
--
--     -- toml
--     "taplo",
--
--     -- yaml
--     -- "yaml-language-server",
--     "yamlfmt",
--
--     -- terraform
--     "hclfmt",
--     "terraform-ls",
--     "tflint",
--   },
-- }

return M
