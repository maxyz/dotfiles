---@diagnostic disable: different-requires
--type conform.options
local options = {
  formatters_by_ft = {
    python = { "ruff_format" },
    -- webdev
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },

    css = { "prettierd" },
    html = { "prettierd" },

    markdown = { "prettierd" },

    haskell = { "fourmolu" },

    rust = { "rustfmt" },

    sh = { "shfmt" },
    java = { "clang-format" },
    ocaml = { "ocamlformat" },

    -- terraform
    terraform = { "tofu_fmt" },
    tf = { "tofu_fmt" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
