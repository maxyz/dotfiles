--type conform.options
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "deno_fmt", "prettierd" },
    javascriptreact = { "deno_fmt", "prettierd" },
    typescript = { "deno_fmt", "prettierd" },
    typescriptreact = { "deno_fmt", "prettierd" },
    markdown = { "deno_fmt", "prettierd" },

    css = { "prettierd" },
    html = { "prettierd" },

    haskell = { "fourmolu" },

    -- python = { "ruff_format" },

    rust = { "rustfmt" },

    sh = { "shfmt" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)