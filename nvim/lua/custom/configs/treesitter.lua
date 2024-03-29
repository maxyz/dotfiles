local M = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "toml",
    "markdown",
    "markdown_inline",
    "c",
    "bash",
    "lua",
  },
  indent = {
    enable = true,
    disable = { "python", "css" },
  },
}
return M
