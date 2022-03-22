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

return M
