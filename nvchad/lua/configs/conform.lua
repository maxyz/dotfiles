---@diagnostic disable: different-requires
--type conform.options
local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    -- webdev
    javascript = { "biome", "prettierd" },
    javascriptreact = { "biome", "prettierd" },
    typescript = { "biome", "prettierd" },
    typescriptreact = { "biome", "prettierd" },

    css = { "biome", "prettierd" },
    html = { "biome", "prettierd" },
    json = { "biome" },
    jsonc = { "biome" },

    markdown = { "prettierd" },

    haskell = { "fourmolu" },

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
