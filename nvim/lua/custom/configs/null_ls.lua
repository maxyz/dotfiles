local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
  -- web world
  b.formatting.prettierd.with({
    extra_filetypes = {"javascript.jsx", "typescript.tsx"}
  }),

  -- python
  b.formatting.black,
}


local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,

    -- format on save
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
    end,
  }
end

return M
