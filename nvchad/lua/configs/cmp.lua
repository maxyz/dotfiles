---@diagnostic disable: different-requires
local cmp = require "cmp"
-- local cmp_defaults = require "cmp.config.default"

-- vim.g.cmp_toggle_flag = false

local M = {}

-- local cmp_config = cmp_defaults()
M.completion = {
  autocomplete = false,
  completeopt = "menu,menuone,noselect",
}
-- M.enabled = function()
--   return cmp_config.enabled() and vim.g.cmp_toggle_flag
-- end
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
}
-- M.experimental = {
--   ghost_text = true,
-- }
-- M.performance = {
--   debounce = 500,
--   throttle = 2000,
-- }

return M
