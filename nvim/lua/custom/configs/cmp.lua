local present, cmp = pcall(require, "cmp")

local M = {}

if not present then
   return M
end

M.mapping = {
  ["<CR>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
}

vim.g.cmp_toggle_flag = true

local default_present, default = pcall(require, "cmp.config.default")

if not default_present then
   return M
end

local default_config = default()

M.enabled = function()
  return default_config.enabled() and vim.g.cmp_toggle_flag
end

return M
