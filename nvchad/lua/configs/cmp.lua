---@diagnostic disable: different-requires
local cmp = require "cmp"
local cmp_defaults = require "cmp.config.default"

vim.g.cmp_toggle_flag = true

local M = {}

local cmp_config = cmp_defaults()
M.completion = {
  completeopt = "menu,menuone,noselect",
}
M.enabled = function()
  return cmp_config.enabled() and vim.g.cmp_toggle_flag
end
M.preselect = cmp.PreselectMode.None
M.mapping = {
  ["<CR>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = false,
  },
}
--   { name = "copilot" },
M.sources = {
  { name = "nvim_lsp" },
  { name = "luasnip" },
  { name = "buffer" },
  { name = "nvim_lua" },
  { name = "path" },
  { name = "codeium" },
}
M.experimental = {
  ghost_text = true,
}

return M
