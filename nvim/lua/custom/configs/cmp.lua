local present, cmp_defaults = pcall(require, "cmp.config.default")

vim.g.cmp_toggle_flag = true

local M = {}

if not present then
   return M
end

local cmp_config = cmp_defaults()

M.enabled = function()
  return cmp_config.enabled() and vim.g.cmp_toggle_flag
end

return M
