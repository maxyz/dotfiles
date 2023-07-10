local cmp_present, cmp = pcall(require, "cmp")
if not cmp_present then
  return
end

local present, cmp_defaults = pcall(require, "cmp.config.default")

vim.g.cmp_toggle_flag = true

local M = {}

if not present then
  return M
end

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
-- M.sources = {
--   { name = "copilot" },
--   { name = "luasnip" },
--   { name = "nvim_lsp" },
--   { name = "buffer" },
--   { name = "nvim_lua" },
--   { name = "path" },
-- }

return M
