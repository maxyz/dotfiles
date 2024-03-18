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

  autotag = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
return M
